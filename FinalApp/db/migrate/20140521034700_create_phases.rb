class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :end_date, null: false

      t.timestamps
    end
    add_index :phases, :title
  end
end
