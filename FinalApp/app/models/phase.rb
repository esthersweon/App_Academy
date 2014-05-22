# == Schema Information
#
# Table name: phases
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  end_date   :date             not null
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer
#

class Phase < ActiveRecord::Base
	validates :title, :end_date, :project_id, presence: true

	belongs_to :project, inverse_of: :phases
	has_many :tasks, inverse_of: :phase

end
