class ChangeAmountOwedDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :payments, :amount_owed,  :integer
  end
end
