# == Schema Information
#
# Table name: schools
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  headmaster_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class School < ActiveRecord::Base
	has_many :students, 
	class_name: "Wizard", 
	foreign_key: :school_id,
	primary_key: :id

	belongs_to :headmaster, 
	class_name: "Wizard",
	foreign_key: :headmaster_id,
	primary_key: :id
end
