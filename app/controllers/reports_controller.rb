class ReportsController < ApplicationController

  before_action :authorize

  def index
    @reports = current_user.person.reports
  end

  def show
    @report = Report.find_by_uuid(params[:uuid])
    @errors = []
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find_by_uuid(params[:uuid])
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      ReportPerson.create(person_id: current_user.person_id, report_id: @report.id)
      redirect_to @report
    else
      render 'new'
    end
  end

  def update
    @report = Report.find_by_uuid(params[:uuid])

    if @report.update(report_params)
      redirect_to report_path
    else
      render 'edit'
    end
  end

  def destroy
    @report = Report.find_by_uuid(params[:uuid])
    @report.destroy

    redirect_to reports_path
  end

  def people_new
    @report = Report.find_by_uuid(params[:report_uuid])
  end

  def create_and_relate_person
    @person = Person.find_or_create_by(person_params)
    @report = Report.find_by_uuid(params[:report_uuid])

    if @person.errors.count == 0
      ReportPerson.create(person_id: @person.id, report_id: @report.id)
      self.redirect_to({action: "show", uuid: @report.uuid})
    else
      self.render 'people_new'
    end
  end

  def reconcile_and_create_owed
    @report = Report.find_by_uuid(params[:report_uuid])
    @errors = []

    if @report.expenses.count == 0
      @errors.append('Report must have at least one expense before reconciling.')
    end

    if @report.report_people.count == 0
      @errors.append('Report must have at least one person before reconciling.')
    end

    if @errors.length > 0
      render 'show'
    else
      @report.reconciled = true
      @report.save

      @report.match_and_create_payments
      self.render 'results'
    end
  end

  def results
    @report = Report.find_by_uuid(params[:report_uuid])
  end

  private

  def report_params
    params.require(:report).permit(:name)
  end

  def person_params
    params.require(:person).permit(:email)
  end
end
