# == Schema Information
#
# Table name: course_enrollments
#
#  id         :integer          not null, primary key
#  student_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CourseEnrollment < ActiveRecord::Base
	belongs_to :student, 
	class_name: "Wizard", 
	foreign_key: :student_id,
	primary_key: :id

	belongs_to :course
end
