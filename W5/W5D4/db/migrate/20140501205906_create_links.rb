class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :text, null: false

      t.timestamps
    end

    add_index :links, :title
  end
end
