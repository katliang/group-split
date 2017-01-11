# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  uuid       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  reconciled :boolean
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "new report should get uuid" do
    report = Report.new
    assert_not_nil report.uuid, "A report uuid should be assigned to a new report."
  end

  test "sum of report expenses" do
    report = reports(:one)
    assert_equal 19.98, report.sum_expenses, "Sum of report expenses is incorrect."
  end

  test "count of report people" do
    report = reports(:one)
    assert_equal 2, report.num_people, "Count of report people is incorrect."
  end

  test "individual obligation calculation" do
    report = reports(:one)
    assert_equal 9.99, report.individual_obligation, "Individual obligation calculation is incorrect."
  end

  test "get totals people paid" do
    report = reports(:one)
    assert_equal report.get_totals_people_paid, {'MyString@email.com' => 19.98, 'MyString2@email.com' => 0.00}, "Get totals people paid calculation is incorrect."
  end

  test "determine owed amounts" do
    report = reports(:one)
    assert_equal report.determine_owed_amounts, {'MyString@email.com' => -9.99, 'MyString2@email.com' => 9.99}, "Determine owed amounts calculation is incorrect."
  end

  test "get people to reimburse" do
    report = reports(:one)
    assert_equal [['MyString@email.com', -9.99]], report.get_people_to_reimburse, "Get people to reimburse calculation is incorrect."
  end

  test "get people who need to pay" do
    report = reports(:one)
    assert_equal [['MyString2@email.com', 9.99]], report.get_people_who_need_to_pay, "Get people who need to pay calculation is incorrect."
  end
end
