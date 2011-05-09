Feature: Agilists can add projects
  In order to share knowledge across the ALENetwork
  As an agilist
  I want to add the projects I've worked or I'm working on
  
  Scenario: Agilists see a link to add their project
    Given I am on the homepage
    Then I should see a link to add my projects
  
  Scenario: Agilists can add a project to the database
    Given I am on the homepage
    And I am logged in
    When I follow the link to add projects
    And I submit a filled in form
    Then I should see my project in the list of projects
    