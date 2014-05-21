# == Schema Information
#
# Table name: phases
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text             not null
#  end_date    :date             not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Phase < ActiveRecord::Base
	validates :title, :description, :end_date, presence: true

	has_many :project_phases, inverse_of: :phase, dependent: :destroy
	has_many :projects, through: :project_phases, source: :project
	has_many :tasks, inverse_of: :phase
	belongs_to :user, inverse_of: :phases

end
