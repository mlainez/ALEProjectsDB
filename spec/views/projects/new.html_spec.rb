require 'spec_helper'

describe "projects/new.html.erb" do
  before :each do
    view.should_receive(:current_user).and_return(mock('User', :id => 1))
  end

  it "contains a form for a new project" do
    render
    rendered.should have_xpath("//form[@action='#{projects_path}']")
  end

  it "contains a drop down lost of european countries, what country code the project is in" do
    render
    rendered.should have_selector("select#project_country_code")
  end

  it "contains a text area for the description of the project" do
    render
    rendered.should have_selector("textarea#project_description")
  end

  it "contains a text area for the practices or tools used in the project" do
    render
    rendered.should have_selector("textarea#project_practices")
  end

  it "contains a text area for the obstacles met during the project" do
    render
    rendered.should have_selector("textarea#project_obstacles")
  end

  it "contains a text field for the sector in which the project takes place" do
    render
    rendered.should have_selector("input#project_sector")
  end

  it "contains a text field to specify the role of the project owner in that project" do
    render
    rendered.should have_selector("input#project_owner_role")
  end

  it "contains submit button for the form" do
    render
    rendered.should have_selector("input[type='submit']")
  end

  it "contains a hidden field for the current user id" do
    render
    rendered.should have_selector("input[type='hidden']")
  end
end
