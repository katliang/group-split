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

class Report < ApplicationRecord
  has_many :report_people
  has_many :expenses
  has_many :people, through: :report_people
  has_many :payments
  after_initialize :init

  def init
    self.uuid ||= SecureRandom.uuid
    self.reconciled ||= false
  end

  def to_param
    uuid
  end

  validates :name, presence: true,
                   length: { minimum: 1 }

  def sum_expenses
    self.expenses.sum(:amount)
  end

  def num_people
    self.people.count(:all)
  end

  def individual_obligation
    self.sum_expenses / self.num_people
  end
end
