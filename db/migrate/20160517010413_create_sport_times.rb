class CreateSportTimes < ActiveRecord::Migration
  def change
    create_table :sport_times do |t|
      t.string :time_stamp, :limit => 11
      t.string :step_num
      t.string :step_style
      t.string :identifier
      t.integer :user_id
    end
  end
end
