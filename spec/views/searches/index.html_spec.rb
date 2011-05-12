require 'spec_helper'

describe "searches/index.html.erb" do
  it "renders the projects partial" do
    project   = mock_model(Project, Factory.attributes_for(:project))
    user      = mock_model(User)
    project.stub!(:user => user)
    projects = [project]
    projects.stub!(:total_pages => 1)
    user.stub!(:linkedin_public_profile => "http://www.example.com", :name => "John Doe")
    @projects = projects
    render
    view.should render_template(:partial => 'shared/_projects')
  end
end