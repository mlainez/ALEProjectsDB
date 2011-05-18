When /^I click on the sign in link$/ do
  click_link("Sign in with Linkedin")
end

Then /^I should see my linkedin name on the screen$/ do
  page.should have_content("John Doe")
end

Then /^I should be redirected to the linked in authentication page$/ do
  steps %Q{
    Then I should be on the linked in authentication page
  }
end

Given /^I am logged in$/ do
  visit "/"
  click_link("Sign in with Linkedin")
  @user         = User.first
  @current_user = @user
end

Then /^I should see a message telling me my authentication failed$/ do
  page.should have_content("Authentication failure")
end
