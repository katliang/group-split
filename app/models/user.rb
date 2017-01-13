# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  person_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

    has_secure_password

    belongs_to :person

    validates :email, presence: true,
                   length: { minimum: 1 },
                   uniqueness: true

end
