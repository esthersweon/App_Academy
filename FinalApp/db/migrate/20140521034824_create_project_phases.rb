class CreateProjectPhases < ActiveRecord::Migration
  def change
    create_table :project_phases do |t|
      t.integer :project_id, null: false
      t.integer :phase_id, null: false

      t.timestamps
    end
  end
end
