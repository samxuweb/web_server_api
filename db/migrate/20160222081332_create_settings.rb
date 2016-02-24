class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.integer :calorie
      t.string :sport_time
      t.integer :step
      t.integer :distance
      # t.timestamps null: false
    end
  end
end
