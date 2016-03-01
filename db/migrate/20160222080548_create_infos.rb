class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :user_id
      t.string :user_sex, :default => '男'
      t.text :head_portrait
      t.integer :image_size, :default => 16
      t.string :nickname, :default => 'john'
      t.integer :age, :default => 25
      t.integer :height, :default => 175
      t.integer :weight, :default => 70
      t.integer :pace
      t.integer :phone_number1
      t.integer :phone_number2

      # t.timestamps null: false
    end
  end
end
