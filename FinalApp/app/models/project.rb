# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  course       :string(255)      not null
#  description  :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#  moderator_id :integer
#

class Project < ActiveRecord::Base
	validates :title, :course, :description, :moderator_id, presence: true

	has_many :project_phases, inverse_of: :project, dependent: :destroy
	has_many :phases, through: :project_phases, source: :phase

	belongs_to :moderator,
	class_name: "User", 
	foreign_key: :moderator_id, 
	inverse_of: :projects
end
