Feature: Agilists can edit their projects
  In order to keep the knowledge I share up to date
  As an agilist
  I want to edit the projects I've worked or I'm working on
  
  Scenario: Agilists see a link to edit their projects
    Given I am logged in
    And I have already submitted a project
    When I go to my projects page
    Then I should see a link to edit each of my projects
    
  Scenario: Agilists can edit their projects
    Given I am logged in
    And I have already submitted a project
    When I go to my projects page
    And I click on the edit link for that project
    And I change the sector of that project to "Education"
    And I submit my changes
    Then I should see "Education" as sector for that project