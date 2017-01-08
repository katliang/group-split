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
    assert_equal report.sum_expenses, 19.98, "Sum of report expenses is incorrect."
  end

  test "count of report people" do
    report = reports(:one)
    assert_equal report.num_people, 2, "Count of report people is incorrect."
  end

  test "individual obligation calculation" do
    report = reports(:one)
    assert_equal report.individual_obligation, 9.99, "Individual obligation calculation is incorrect."
  end
end
