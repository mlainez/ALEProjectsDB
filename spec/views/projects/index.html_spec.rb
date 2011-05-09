require 'spec_helper'

describe "projects/index.html.erb" do
  let(:project1) { mock_model(Project, :sector => "Government IT") }
  let(:project2) { mock_model(Project, :sector => "Startup company")}
  
  before :each do
    assign(:projects, [project1, project2])
  end
  
  it "gets the sector for each project" do
    project1.should_receive(:sector)
    project2.should_receive(:sector)
    render
  end
  
  it "displays all projects sector" do
    render
    rendered.should contain("Government IT")
    rendered.should contain("Startup company")
  end
end