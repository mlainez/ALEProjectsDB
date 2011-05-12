Feature: Agilists can search within the list of projects
  In order to find someone that could help me with my project
  As an agilist
  I want to search for every project that matches mine
  
  @omniauth_test
  Scenario: Agilists search for a project and finds one
    Given I am logged in
    And there is a project with sector "Government" added by another agilist
    When I go to the homepage
    And I search for "Government"
    Then I should see that project in the search results

  @omniauth_test
  Scenario: Agilists search for a project and finds none
    Given I am logged in
    And there is a project with sector "Government" added by another agilist
    When I go to the homepage
    And I search for "Education"
    Then I should not see any projects in the search results