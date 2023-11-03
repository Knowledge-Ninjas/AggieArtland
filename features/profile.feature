Feature: User profile
    As a registered user,
    So that I can see personal information related to the trail,
    I want be on my user profile page.

    Scenario: Go to map
    Given I am logged in
    And I am on the user profile page
    When I press the 'Go to Map' link
    Then I should be on the map page

    Scenario: Go to edit page
    Given I am logged in
    And I am on the user profile page
    When I press the 'Edit' link
    Then I should be on the edit page