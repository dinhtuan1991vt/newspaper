@javascript
Feature: Login
  Scenario: Login page
    Given I go to login page
    And I fill in "author[login]" with "author1@yopmail.com"
    And I fill in "author[password]" with "12345678"
    When I press "Log in"
    And I wait for 2 seconds
    Then page have message "Signed in successfully."