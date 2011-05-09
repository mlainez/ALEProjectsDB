require 'spec_helper'

describe "my_projects/index.html.erb" do
  let(:project1) { mock_model(Project, :sector => "Government IT") }
  let(:project2) { mock_model(Project, :sector => "Startup company")}
  
  before :each do
    assign(:projects, [project1, project2])
  end
  
  it "displays an edit linke for each project" do
    render
    rendered.should have_selector("a", :content => "Edit")
  end
end