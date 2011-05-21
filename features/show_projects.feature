Feature: Agilists can see projects details
  In order to know if a project matches my interests
  As an Agilist
  I want to be able to see it's entire entire

  @omniauth_test @javascript
  Scenario: Agilists can click on projects table rows and see its details
    Given I am logged in
    And I have already submitted a project
    When I go to the projects page
    And I click on a project row
    Then I should see the full detail for that project
