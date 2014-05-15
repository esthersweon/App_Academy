class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :body, null: false

      t.timestamps
    end

    add_index :posts, :title
  end
end
