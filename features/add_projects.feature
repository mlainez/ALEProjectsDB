Feature: Agilists can add projects
  In order to share knowledge across the ALENetwork
  As an agilist
  I want to add the projects I've worked or I'm working on
  
  Scenario: Agilists see a link to add their project
    Given I am on the homepage
    Then I should see a link to add my projects
  
  @omniauth_test
  Scenario: Agilists can add a project to the database
    Given I am on the homepage
    And I am logged in
    When I follow the link to add projects
    And I submit a filled in form
    Then I should see my project in the list of projects

  @omniauth_test
  Scenario: Agilists add project with missing required fileds
    Given I am logged in
    And I follow the link to add projects
    When I submit a project form with missing fields
    Then I should see that the form could not be submitted
    
