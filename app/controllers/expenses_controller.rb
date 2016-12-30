class ExpensesController < ApplicationController
  def create
    @report = Report.find_by_uuid(params[:report_uuid])
    @expense = @report.expenses.new(expense_params)
    @expense.person_id = @report.people.first.id
    @expense.save
    redirect_to report_path(@report)
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
  end

  private
    def expense_params
      params.require(:expense).permit(:vendor, :date, :amount)
    end
end
