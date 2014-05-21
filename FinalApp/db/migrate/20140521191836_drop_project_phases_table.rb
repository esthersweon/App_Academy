class DropProjectPhasesTable < ActiveRecord::Migration
  def change
  	drop_table :project_phases
  end
end
