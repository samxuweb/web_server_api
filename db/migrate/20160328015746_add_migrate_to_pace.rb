class AddMigrateToPace < ActiveRecord::Migration
  def change
    change_column :infos, :pace, :integer, :default => 70
  end
end
