Feature: Engagement Tracking
  As a user
  I want to check in at various exhibits and collect virtual "stamps" or points
  So that I can track my progress along the trail and save it for sharing

Scenario: Check in at Exhibit
  Given I am viewing an exhibit on the interactive map
  When I tap on the check-in button
  Then my visit to the exhibit should be recorded
  And I should receive a virtual "stamp" or points
