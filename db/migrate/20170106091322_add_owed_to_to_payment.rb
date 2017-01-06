class AddOwedToToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :owed_to_person_id, :integer
  end
end
