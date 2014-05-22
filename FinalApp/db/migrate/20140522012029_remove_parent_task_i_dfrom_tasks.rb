class RemoveParentTaskIDfromTasks < ActiveRecord::Migration
  def change
  	remove_column :tasks, :parent_task_id
  end
end
