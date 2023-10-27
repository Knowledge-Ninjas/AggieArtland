Feature: Navigation 
    As a registered user,
    So that I can go to every page,
    I want to be able to press buttons to Navigate.

    Scenario: Navigate to Map
    Given I am on any page,
    When I click on the map button,
    Then I should be on the map page.

    Scenario: Navigate to Art Piece List
    Given I am on any page,
    When I click on the Art Piece button,
    Then I should be on the Art Piece page.

    Scenario: Navigate to Admin Panel
    Given I am an Admin,
    When I click on the Admin Panel button,
    Then I should be on the Admin Panel page.

    Scenario: Navigate to Admin Panel if not admin
    Given I am not an Admin,
    When I click on the Admin Panel button, 
    Then I should see a flash that says I need to be an admin,
    And be redirected to the login page.