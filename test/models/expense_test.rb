# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  report_id  :integer
#  vendor     :string           not null
#  date       :date             not null
#  amount     :decimal(, )      not null
#  is_paid    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
