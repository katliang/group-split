# == Schema Information
#
# Table name: report_people
#
#  id         :integer          not null, primary key
#  report_id  :integer
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReportPerson < ApplicationRecord
  belongs_to :report
  belongs_to :person
end
