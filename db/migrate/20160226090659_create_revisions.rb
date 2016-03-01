class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.string :version
      t.string :file_name
      t.string :file_url
#      t.timestamps null: false
    end
  end
end
