require 'spec_helper'

describe CourseEnrollment do
  subject(:c_e) {CourseEnrollment.first}
  it "has a student" do
    expect(c_e.student.fname).to eq("Harry")
  end

  it "has a course" do
    expect(c_e.course.title).to eq("Transfiguration")
  end
end
