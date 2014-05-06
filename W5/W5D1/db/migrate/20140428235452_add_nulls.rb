class AddNulls < ActiveRecord::Migration
  def change
    change_column :posts, :user_id, :integer, null: false
    change_column :circle_memberships, :circle_id, :integer, null: false
    change_column :circles, :title, :string, null: false
    change_column :links, :post_id, :integer, null: false
    change_column :posts, :body, :string, null: false
  end
end
