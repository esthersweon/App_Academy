require 'spec_helper'

describe School do
  subject(:hogwarts) {School.find_by_name("Hogwarts")}

  it "protects students" do
    harry = Wizard.find_by_fname("Harry")
    ron = Wizard.find_by_fname("Ron")
    hermy = Wizard.find_by_fname("Hermione")
    expect(hogwarts.students).to include(harry, ron, hermy)
  end

  it "is run by a headmaster" do
    expect(hogwarts.headmaster.lname).to eq("Dumbledore")
  end

end
