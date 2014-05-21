class AddUserIdToPhase < ActiveRecord::Migration
  def change
    add_column :phases, :user_id, :integer
  end
end
