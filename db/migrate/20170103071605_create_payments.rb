class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :person_id, :null => false
      t.integer :report_id, :null => false
      t.decimal :amount_owed, :null => false
      t.boolean :has_paid, :null => false

      t.references :report, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
