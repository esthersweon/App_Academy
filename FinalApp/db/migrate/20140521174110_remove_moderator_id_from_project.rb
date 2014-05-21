class RemoveModeratorIdFromProject < ActiveRecord::Migration
  def change
  	remove_column :projects, :moderator_id
  end
end
