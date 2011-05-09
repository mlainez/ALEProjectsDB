Feature: Users log in through Linkedin
  
  In order to be identified by the application
  As a User
  I want to sign in with my linkedin account

  @omniauth_test
  Scenario: Redirect to linkedin when sign in
    Given I am on the homepage
    When I click on the sign in link
    Then I should see my linkedin name on the screen