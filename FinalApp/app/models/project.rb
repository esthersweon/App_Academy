# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  course      :string(255)      not null
#  description :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
	validates :title, :course, :description, presence: true

	has_many :phases, inverse_of: :project, dependent: :destroy
end
