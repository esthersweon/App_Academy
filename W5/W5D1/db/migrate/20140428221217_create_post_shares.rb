class CreatePostShares < ActiveRecord::Migration
  def change
    create_table :post_shares do |t|
      t.integer :post_id, null: false
      t.integer :circle_id, null: false

      t.timestamps
    end
  end
end
