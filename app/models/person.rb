# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  uuid       :string
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  has_many :report_people
  has_many :expenses
  has_many :reports, through: :report_people

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
end
