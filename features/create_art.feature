Feature: Create Art Piece
  As an administrator
  I want to add an art piece to my database
  So that I can provide information about the art and its coordinates of latitude and longitude

Scenario: Add Art Piece
  Given I am logged in as an administrator
  When I navigate to the "Add Art Piece" page
  And I fill in the art piece details
  And I provide the coordinates of latitude and longitude
  And I submit the form
  Then the art piece should be added to the database
