class ChangeAmountDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :expenses, :amount,  :integer
  end
end
