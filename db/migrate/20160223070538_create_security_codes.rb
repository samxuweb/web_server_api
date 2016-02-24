class CreateSecurityCodes < ActiveRecord::Migration
  def change
    create_table :security_codes do |t|
      t.string :code
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
