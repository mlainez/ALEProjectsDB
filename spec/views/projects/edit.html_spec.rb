require 'spec_helper'

describe "projects/edit.html.erb" do
  before :each do
    view.should_receive(:current_user).and_return(mock('User', :id => 1))
    @project = Factory.build :project
  end
  
  it "renders the partial containing the project form" do
    render
    rendered.should render_template("projects/_form")
  end
end