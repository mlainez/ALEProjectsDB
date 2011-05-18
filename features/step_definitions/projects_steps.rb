Then /^I should see a link to add my projects$/ do
  assert page.has_link?("Add a project")
end

When /^I follow the link to add projects$/ do
  click_link("Add a project")
end

When /^I submit a filled in form$/ do
  fill_in("project_sector",      :with => "Government IT")
  fill_in("project_description", :with => "Project description")
  fill_in("project_practices",   :with => "Scrum")
  fill_in("project_obstacles",   :with => "Management buy-in")
  fill_in("project_owner_role",  :with => "Developer")
  click_button("Submit")
end

Then /^I should see my project in the list of projects$/ do
  steps %Q{
    Then I should be on the projects page
  }
  page.should have_content("Government IT")
end

Given /^I have already submitted a project$/ do
  @project = Factory :project, :user => @current_user
end

Then /^I should see a link to edit each of my projects$/ do
  page.all(".project").each do |project|
    project.should have_content("Edit")
  end
end

When /^I click on the edit link for that project$/ do
  click_link("Edit")
end

When /^I change the sector of that project to "([^"]*)"$/ do |sector|
  fill_in("project_sector", :with => sector)
end

When /^I submit my changes$/ do
  click_button("Submit")
end

Then /^I should see "([^"]*)" as sector for that project$/ do |sector|
  page.should have_content(sector)
end

Given /^there is a project with sector "([^"]*)" added by another agilist$/ do |sector|
  @project = Factory :project, :sector => sector
end

Then /^I should see that project in the search results$/ do
  page.should have_content(@project.sector)
end

Then /^I should not see any projects in the search results$/ do
  page.should_not have_content(@project.sector)
end

When /^I submit a project form with missing fields$/ do
  fill_in("project_sector",      :with => "Government IT")
  fill_in("project_description", :with => "Project description")
  click_button("Submit")
end

Then /^I should see that the form could not be submitted$/ do
  page.should have_content "Please fill in the missing fields"
end
