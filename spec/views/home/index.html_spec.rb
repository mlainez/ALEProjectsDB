require 'spec_helper'

describe "home/index.html.erb" do
  it "shows a link to add projects" do
    render
    rendered.should have_xpath("//a[text()='Add a project']")
  end
  
  it "shows a form to search the projects" do
    render
    rendered.should have_selector("#search-box")
  end
  
  it "shows a search field" do
    render
    rendered.should have_selector("input#search-field")
  end
end