class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :parent_task_id, null: false
      t.integer :phase_id, null: false

      t.timestamps
    end
    
    add_index :tasks, :title
  end
end
