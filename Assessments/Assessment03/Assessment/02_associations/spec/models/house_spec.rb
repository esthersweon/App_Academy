require 'spec_helper'

describe House do
  subject(:gryffindor) {House.find_by_name("Gryffindor")}

  it "houses a master" do
    expect(gryffindor.master.lname).to eq("McGonagall")
  end

  it "houses students" do
    harry = Wizard.find_by_fname("Harry")
    ron = Wizard.find_by_fname("Ron")
    hermy = Wizard.find_by_fname("Hermione")
    expect(gryffindor.students).to eq([harry, ron, hermy])
  end

  it "knows its master's school" do
    expect(gryffindor.school.name).to eq("Hogwarts")
  end

end
