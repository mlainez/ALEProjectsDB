When /^I search for "([^"]*)"$/ do |search|
  fill_in "search-field", :with => search
  click_button "Search"
end