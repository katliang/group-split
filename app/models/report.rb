# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  uuid       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
  has_many :report_people
  has_many :expenses
  has_many :people, through: :report_people
  after_initialize :init

  def init
    self.uuid ||= SecureRandom.uuid
  end

  def to_param
    uuid
  end

  validates :name, presence: true,
                   length: { minimum: 1 }
end
