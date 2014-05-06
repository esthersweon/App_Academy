class CreateTattoos < ActiveRecord::Migration
  def change
    create_table :tattoos do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.integer :fighter_id, :null => false
      t.timestamps
    end
  end
end
