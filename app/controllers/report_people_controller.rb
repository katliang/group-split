class ReportPeopleController < ApplicationController

  before_filter :authorize

  def destroy
    @report = Report.find_by_uuid(params[:report_uuid])
    @report_person = @report.report_people.find(params[:id])

    @report_person.destroy
    redirect_to report_path(@report)
  end
end
