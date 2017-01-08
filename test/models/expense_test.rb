# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  report_id  :integer
#  vendor     :string           not null
#  date       :date             not null
#  amount     :decimal(, )      not null
#  is_paid    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test "new expense should be unpaid" do
    expense = Expense.new
    assert_not_equal(expense.is_paid, "An expense should be marked unpaid initially.")
  end
end
