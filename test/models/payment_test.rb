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

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test "new payment should be unpaid" do
    payment = Payment.new
    assert_not_equal(payment.has_paid, "A payment should be marked unpaid initially.")
  end
end
