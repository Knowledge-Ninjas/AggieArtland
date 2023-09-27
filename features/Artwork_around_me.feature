Feature: Artwork around me
  As a user
  I want to view all artworks around my location
  So that I can unlock additional information, artist bios, and behind-the-scenes details

Scenario: Location detecting
  Given I am browsing the interactive map
  Then I should see all exhibits around my vicinity (20m)

