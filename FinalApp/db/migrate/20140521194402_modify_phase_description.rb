class ModifyPhaseDescription < ActiveRecord::Migration
  def change
  	remove_column :phases, :description 
  	add_column :phases, :description, :text
  end
end
