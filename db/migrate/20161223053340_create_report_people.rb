class CreateReportPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :report_people do |t|
      t.references :report, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
