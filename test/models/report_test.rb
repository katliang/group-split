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
    assert_not_nil(report.uuid, "A report uuid should be assigned to a new report.")
  end
end
