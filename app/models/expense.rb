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

  def init
    self.is_paid ||= false
    self.date ||= Date.today
  end

  validates :vendor, presence: true,
                     length: { minimum: 1 }

  validates :date, presence: true

  validate :date_not_in_future

  def date_not_in_future
    if self.date && self.date > Date.today
      errors.add(:date, 'cannot be in the future.')
    end
  end

  validates :amount, presence: true,
                     numericality: { greater_than: 0}

end
