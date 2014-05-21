class RemoveDescriptionFromPhase < ActiveRecord::Migration
  def change
  	remove_column :phases, :description
  end
end
