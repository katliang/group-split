# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  uuid       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  has_many :report_people
  has_many :expenses
  has_many :reports, through: :report_people
  has_many :payments
  after_initialize :init

  def init
    self.uuid ||= SecureRandom.uuid
  end

  def to_param
    uuid
  end

  validates :email, presence: true,
                   length: { minimum: 1 },
                   uniqueness: true

  def amount_paid
    self.expenses.sum(:amount)
  end

  def amount_owed(report)
    report.individual_obligation - self.amount_paid
  end
end
