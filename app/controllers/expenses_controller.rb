class ExpensesController < ApplicationController

  before_action :authorize

  def create
    @report = Report.find_by_uuid(params[:report_uuid])
    ep = expense_params
    ep[:amount] = expense_params[:amount].to_f * 100
    @expense = @report.expenses.new(ep)
    @expense.attributes = {'person_id': person_params[:id]}

    if @expense.save
      redirect_to report_path(@report)
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @report = Report.find_by_uuid(params[:report_uuid])
    @expense = @report.expenses.find(params[:id])

    @expense.destroy
    redirect_to report_path(@report)
  end

  def new
    @report = Report.find_by_uuid(params[:report_uuid])
    @expense = @report.expenses.build
  end

  private
    def expense_params
      params.require(:expense).permit(:vendor, :date, :amount)
    end

    def person_params
      params.require(:person).permit(:id)
    end
end
