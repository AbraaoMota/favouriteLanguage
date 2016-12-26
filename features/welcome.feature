Feature: Welcome Page

  Scenario: Greeting
    When I view index page
    Then I am greeted by the page
    And I can search for a user name

  Scenario: Searching for a valid user
    Given I am at the index page
    When I search for a valid user name
    Then I can see that user's favourite language

  Scenario: Searching for a non-existing user
    Given I am at the index page
    When I search for an invalid user name
    Then I am told that that user doesn't exist
