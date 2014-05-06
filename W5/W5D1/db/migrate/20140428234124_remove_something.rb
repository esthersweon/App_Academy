class RemoveSomething < ActiveRecord::Migration
  def change
    remove_column :posts, :link_id
  end
end
