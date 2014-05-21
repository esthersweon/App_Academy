# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  title          :string(255)      not null
#  parent_task_id :integer          not null
#  phase_id       :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Tasks < ActiveRecord::Base
	validates :title, :phase_id, presence: true

	belongs_to :phase, inverse_of: :tasks
	
	has_many :child_tasks,
	class_name: "Task", 
	foreign_key: :parent_task_id, 
	primary_key: :id

	belongs_to :parent_task, 
	class_name: "Task", 
	foreign_key: :parent_task_id, 
	primary_key: :id
end
