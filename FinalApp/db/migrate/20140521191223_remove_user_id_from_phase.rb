class RemoveUserIdFromPhase < ActiveRecord::Migration
  def change
  	remove_column :phases, :user_id
  end
end
