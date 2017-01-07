# == Schema Information
#
# Table name: payments
#
#  id                :integer          not null, primary key
#  person_id         :integer
#  report_id         :integer
#  amount_owed       :decimal(, )      not null
#  has_paid          :boolean          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  owed_to_person_id :integer
#

class Payment < ApplicationRecord
  belongs_to :report
  belongs_to :person
  belongs_to :owed_to_person, class_name: "Person"
  after_initialize :init

  def init
    self.has_paid ||= false
  end
end
