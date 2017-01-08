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

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "new person should get uuid" do
    person = Person.new
    assert_not_nil(person.uuid, "A person uuid should be assigned to a new person.")
  end
end
