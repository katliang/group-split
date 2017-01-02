class AddStatusToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :reconciled, :boolean
  end
end
