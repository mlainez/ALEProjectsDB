require 'spec_helper'

describe "projects/index.html.erb" do
  let(:user)     { mock_model(User) }
  let(:project1) { mock_model(Project, Factory.attributes_for(:project)) }
  let(:project2) { mock_model(Project, Factory.attributes_for(:project)) }
  
  before :each do
    assign(:projects, [project1, project2])
    project1.stub!(:user => user)
    project2.stub!(:user => user)
    user.stub!(:name => "John Doe")
    user.stub!(:linkedin_public_profile => "http://www.example.com")
  end
  
  it "gets the sector for each project" do
    project1.should_receive(:sector)
    project2.should_receive(:sector)
    render
  end
  
  it "displays all projects sector" do
    render
    rendered.should contain(project1.sector)
    rendered.should contain(project2.sector)
  end
end