# == Schema Information
#
# Table name: project_phases
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  phase_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ProjectPhases < ActiveRecord::Base
	validates :project_id, :phase_id, presence: true

	belongs_to :project, inverse_of: :project_phases
	belongs_to :phase, inverse_of: :project_phases
end
