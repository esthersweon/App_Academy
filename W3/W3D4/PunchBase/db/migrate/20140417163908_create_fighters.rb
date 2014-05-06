class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :name, :null => false
      t.integer :weight, :null => false
      t.integer :gym_id
      t.timestamps
    end

    add_index :fighters, :gym_id
  end
end
