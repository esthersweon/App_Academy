# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  Wizard.create!(:fname => "Harry", :lname => "Potter", 
                :house_id => 1, :school_id => 1)
  Wizard.create!(:fname => "Ron", :lname => "Weasley",
                 :house_id => 1, :school_id => 1)
  Wizard.create!(:fname => "Hermione", :lname => "Granger",
                 :house_id => 1, :school_id => 1)
  mcg = Wizard.create!(:fname => "Professor", :lname => "McGonagall",
                       :school_id => 1)
  alb = Wizard.create!(:fname => "Albus", :lname => "Dumbledore",
                :school_id => 1)
  
  House.create!(:name => "Gryffindor", :master_id => mcg.id, 
               :building => "The stone one")
  House.create!(:name => "Hufflepuff", :building => "The stone one")

  School.create!(:name => "Hogwarts", :headmaster_id => alb.id)
  Course.create!(:instructor_id => mcg.id, :title => "Transfiguration",
                 :description => "Turning one thing into another thing")
  CourseEnrollment.create!(:course_id => 1, :student_id => 1)
  CourseEnrollment.create!(:course_id => 1, :student_id => 2)
  CourseEnrollment.create!(:course_id => 1, :student_id => 3)

  Wand.create!(:core_ingredient => "Phoenix Feather", :owner_id => 1)
  Wand.create!(:core_ingredient => "Swag", :owner_id => alb.id)





end