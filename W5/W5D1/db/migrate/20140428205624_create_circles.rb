class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
