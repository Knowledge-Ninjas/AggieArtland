Feature: Admin Page
  As an admin
  I want to be able to manage the art pieces database
  So that I can keep the map upto date

  Scenario: List all the Art Pieces in the database
    Given I am logged in as an admin
    When I open the admin page
    Then I should be able to view all the details of the current art pieces 

  Scenario: Create a New Art Piece
    Given I am in the Index page 
    When I click on the new art piece button
    Then I should be redirected to the page
    And I should to be able to input the details of the new Art Piece
    And it should be updated in the database within 10 seconds

  Scenario: Update an Existing Art Piece
    Given I am in the show location page
    When I click the edit location button
    Then I should be redirected to the updating page 
    And I should be able to change any aspect of the Art Piece
    And it should be updated in the database within 10 seconds

  Scenario: Deleting an Existing Art Piece
    Given I am on the show location page
    When I click on the delete location button
    Then it should be deleted from the database within 10 seconds

  Scenario: Show this art piece
    Given I am on the Index page
    When I click on show this art piece
    Then I should be able to see all the details of a certain art piece
