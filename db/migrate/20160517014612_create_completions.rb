class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.string :date, :limit => 8
      t.string :complete
      t.string :total_step
      t.string :total_time
      t.string :calorie
      t.string :distance
      t.string :walk_step
      t.string :run_step
      t.string :cycle_step
      t.string :stairs_step
      t.integer :user_id
    end
  end
end
