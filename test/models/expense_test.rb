# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  report_id  :integer
#  vendor     :string           not null
#  date       :date             not null
#  amount     :integer          not null
#  is_paid    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test "new expense should be unpaid" do
    expense = Expense.new
    assert_not_equal expense.is_paid, "An expense should be marked unpaid initially."
  end

  test "expense amounts should be converted before saving" do
    report = reports(:one)
    expense = report.expenses.new
    expense.amount = 100.00
    assert_equal 10000, expense.send(:convert), "An expense should be multiplied by 100 before saving."
  end
end
