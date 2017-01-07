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

  def get_totals_people_paid
    totals_paid = {}
    self.people.each do |person|
        totals_paid[person.email] = person.expenses.where(report_id: self.id).sum(:amount)
    end
    totals_paid
  end

  def determine_owed_amounts
    amounts_owed = {}
    self.get_totals_people_paid.each do |email, amount|
      amounts_owed[email] = self.individual_obligation - amount
    end
    amounts_owed
  end

  def get_people_to_reimburse
    people_to_reimburse = []
    self.determine_owed_amounts.each do |email, amount|
      # Negative amount denotes person needs to be reimbursed
      if amount < 0
        people_to_reimburse.push([email, amount])
      end
    end
    people_to_reimburse.sort {|a,b| a[1] <=> b[1]}
  end

  def get_people_who_need_to_pay
    people_who_need_to_pay = []
    self.determine_owed_amounts.each do |email, amount|
      # Positive amount denotes person needs to pay
      if amount > 0
        people_who_need_to_pay.push([email, amount])
      end
    end
    people_who_need_to_pay.sort {|a,b| b[1] <=> a[1]}
  end

  def match_and_create_payments
    people_who_need_to_pay = self.get_people_who_need_to_pay
    people_to_reimburse = self.get_people_to_reimburse

    while people_who_need_to_pay.length > 0
      # check if largest reimbursement amount exceeds or equals largest owed amount
      if people_to_reimburse[0][1].abs >= people_who_need_to_pay[0][1]
        # amount to be paid is the largest owed amount
        payment_amount = people_who_need_to_pay[0][1]
      else
      # largest reimbursement amount is less than largest owed amount
      # max payment can only be up to reimbursement amount
        payment_amount = people_to_reimburse[0][1].abs
      end

      # generate a new payment
      self.create_payment(people_who_need_to_pay[0][0], people_to_reimburse[0][0], payment_amount)
      # update for payment created
      people_to_reimburse[0][1] += payment_amount
      people_who_need_to_pay[0][1] -= payment_amount

      # remove item from either list if amount to be reconciled gets to 0
      if people_to_reimburse[0][1] == 0
        people_to_reimburse.delete_at(0)
      end

      if people_who_need_to_pay[0][1] == 0
        people_who_need_to_pay.delete_at(0)
      end
    end
  end

  def create_payment(pay_from_email, pay_to_email, amount)
    @p_person = self.people.find_by email: pay_from_email
    @n_person = self.people.find_by email: pay_to_email
    Payment.create(person_id: @p_person.id , report_id: self.id, amount_owed: amount, owed_to_person_id: @n_person.id)
  end
end
