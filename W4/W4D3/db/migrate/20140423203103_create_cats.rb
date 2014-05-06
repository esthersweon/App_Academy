class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :age , null: false
      t.date :birth_date
      t.string :color , null: false
      t.string :name
      t.string :sex, null: false
      t.timestamps
    end
  end
end
