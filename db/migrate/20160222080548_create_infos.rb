class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :user_id
      t.string :user_sex
      t.text :head_portrait
      t.string :image_size
      t.string :nickname
      t.integer :age
      t.integer :height
      t.integer :weight
      t.integer :pace
      t.integer :phone_number1
      t.integer :phone_number2

      # t.timestamps null: false
    end
  end
end
