class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.integer :calorie, :default => 320
      t.integer :sport_time, :default => 70
      t.integer :step, :default => 8000
      t.float :distance, :default => 5.7
      # t.timestamps null: false
    end
  end
end
