class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.integer :person_id, :null => false
      t.integer :report_id, :null => false
      t.string :vendor, :null => false
      t.date :date, :null => false
      t.decimal :amount, :null => false
      t.boolean :is_paid, :null => false

      t.references :report, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
