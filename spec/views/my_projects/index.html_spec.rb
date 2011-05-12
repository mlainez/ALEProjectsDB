require 'spec_helper'

describe "my_projects/index.html.erb" do
  let(:project1) { mock_model(Project, Factory.attributes_for(:project) ) }
  let(:project2) { mock_model(Project, Factory.attributes_for(:project) ) }
  let(:projects) { [project1, project2] }
  
  before :each do
    assign(:projects, projects)
    projects.stub!(:total_pages => 1)
  end
  
  it "displays an edit link for each project" do
    render
    rendered.should have_selector("a", :content => "Edit")
  end
end