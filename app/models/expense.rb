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

class Expense < ApplicationRecord
  belongs_to :report
  belongs_to :person
  after_initialize :init
  before_create :convert

  def init
    self.is_paid ||= false
  end

  def convert
    self.amount *= 100
  end
end
