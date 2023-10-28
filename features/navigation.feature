Feature: Navigation 
    As a registered user
    So that I can go to every page
    I want to be able to press buttons to Navigate

    Scenario: Navigate to Map
    Given I have signed up with email "abc@gmail.com", name "admin", and password "asdfasdf"
    And I am logged in with email "abc@gmail.com" and password "asdfasdf"
    When I am in the Map Page
    When I press on "Map button" 
    Then I should be on the map page

    Scenario: Navigate to Art Piece List
    Given I have signed up with email "abc@gmail.com", name "admin", and password "asdfasdf"
    And I am logged in with email "abc@gmail.com" and password "asdfasdf"
    When I am in the Map Page
    When I press on "Art Pieces"
    Then I should be on the Art Piece page

    Scenario: Navigate to Admin Panel
    Given I have signed up with email "test@gmail.com", name "a_admin", and password "testtest"
    And I am logged in with email "test@gmail.com" and password "testtest"
    When I am in the Map Page
    When I press on "Admin Panel"
    Then I should be on the Admin Panel page

    Scenario: Navigate to Admin Panel if not admin
    Given I have signed up with email "asf@gmail.com", name "ash", and password "asdfasdf"
    And I am logged in with email "asf@gmail.com" and password "asdfasdf"
    When I am in the Map Page
    Then I should not see Admin Panel button