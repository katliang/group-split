class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :people, :person_uid, :uuid
  end
end
