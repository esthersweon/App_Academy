# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  phase_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
	validates :title, :phase_id, presence: true

	belongs_to :phase, inverse_of: :tasks
end
