require 'spec_helper'

describe Course do
  subject(:transfiguration) {Course.find_by_title("Transfiguration")}

  it "is taught by an instructor" do
    expect(transfiguration.instructor.lname).to eq("McGonagall")
  end

  describe "enrollments" do
    before(:each) do
      @new_student = Wizard.create!(:fname => "Newbie")
      @new_enrollment = CourseEnrollment.create!(:student_id => @new_student.id, :course_id => transfiguration.id)
    end

    it "students can enroll successfully" do  
      expect(transfiguration.student_enrollments).to include(@new_enrollment)
    end

    it "keeps track of students" do
      harry = Wizard.find_by_fname("Harry")
      ron = Wizard.find_by_fname("Ron")
      hermy = Wizard.find_by_fname("Hermione")
      expect(transfiguration.students).to include(@new_student, harry, ron, hermy)
    end
  end

  it "is part of a school" do
    expect(transfiguration.school.name).to eq("Hogwarts")
  end

end
