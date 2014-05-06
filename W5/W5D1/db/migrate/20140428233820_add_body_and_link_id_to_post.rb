class AddBodyAndLinkIdToPost < ActiveRecord::Migration
  def change

    add_column :posts, :body, :text
    add_column :posts, :link_id, :integer
  end
end
