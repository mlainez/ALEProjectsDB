Feature: Agilists can delete their projects
  In order to keep my shared information up to date
  As an agilist
  I want to be able to delete one of my projects

  @omniauth_test
  Scenario: Successful removal
    Given I am logged in
    And I have already submitted a project
    When I go to my projects page
    And I delete one of my projects
    Then I should not see that project in my projects list anymore
