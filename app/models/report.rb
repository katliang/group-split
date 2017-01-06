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
        totals_paid[person.email] = person.expenses.sum(:amount)
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

  def determine_pay_to
    pays = []
    self.get_people_to_reimburse.each do |n_email, n_amount|
      self.get_people_who_need_to_pay.each do |p_email, p_amount|
        if n_amount.abs >= p_amount
          pays.push([p_email, p_amount, n_email])
          @p_person = self.people.find_by email: p_email
          @n_person = self.people.find_by email: n_email
          Payment.create(person_id: @p_person.id , report_id: self.id, amount_owed: p_amount, owed_to_person_id: @n_person.id)
        end
      end
    end
    pays
  end
end
