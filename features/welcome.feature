Feature: Welcome Page

  Scenario: Greeting
    When I view index page
    Then I am greeted by the page
    And I can search for a user name

  Scenario: Searching for a user
    Given I am at the index page
    When I search for a user name
    Then I can see that user's favourite language
