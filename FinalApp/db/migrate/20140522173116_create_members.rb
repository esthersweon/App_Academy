class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :members, :user_id
  end
end
