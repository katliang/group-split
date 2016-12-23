class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to @report
    else
      render 'new'
    end
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      redirect_to @report
    else
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    redirect_to reports_path
  end

  def people_new
    @report = Report.find(params[:report_id])
  end

  def create_and_relate_person
    @person = Person.new(person_params)
    @report = Report.find(params[:report_id])

    if @person.save
      ReportPerson.create({person: @person, report: @report})
      redirect_to @report
    else
      render 'people_new'
    end

  end

  private

  def report_params
    params.require(:report).permit(:name)
  end

  def person_params
    params.require(:person).permit(:name, :email)
  end
end
