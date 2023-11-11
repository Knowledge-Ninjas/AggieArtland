Feature: Stamps
    As a user,
    So that I can see a preview of my collected stamps,
    I want to see a row of my most recent stamps in my profile.

Background: users in database
Given the following users exist:
    | email             | password_digest | name  |
    | abc@gmail.com     | abc123          | Abet  |
    | xyz@gmail.com     | asj438f84       | Kayla |
    | and123@yahoo.com  | password01      | Syd   |
    | pete@gmail.com    | idk1234         | Pete  |
And the following art pieces exist:
    | name       | address   | latitude    | longitude    |
    | Zachry     | 125 Spence St, College Station, TX 77843 | 30.6214878  | -96.3403293  |
    | Kleberg    | foobar    | 30.6108349  | -96.3476426  |
    | Piece A    | foobar    | 30.6108349  | -96.3476426  |
    | Piece B    | foobar    | 30.6108349  | -96.3476426  |

    Scenario: Stamps in profile
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I visit my profile
        Then I should see "Billy Bob"
        And I should see "Stamps"

    Scenario: No Zachry stamp in profile by default
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I visit my profile
        Then I should not see "Zachry"

    Scenario: Not in proximity to art piece when checking in
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I am located at Zachry
        And I go to the second art piece
        And I click "Check-in to this art piece"
        Then I should see "You need to be within"

    Scenario: Check in to art piece once in proximity
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I am located at Zachry
        And I go to the first art piece
        And I click "Check-in to this art piece"
        Then I should see "Checked in to art piece Zachry!"

    Scenario: Check in to art piece twice
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I am located at Zachry
        And I go to the first art piece
        And I click "Check-in to this art piece"
        And I click "Check-in to this art piece"
        And I should see "You've already checked in to art piece Zachry!"

    Scenario: No Zachry stamp in profile by default
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I visit my profile
        Then I should not see "Zachry"

    Scenario: Get stamp from art piece check-in
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I am located at Zachry
        And I go to the first art piece
        And I click "Check-in to this art piece"
        And I visit my profile
        Then I should see "Zachry"

    Scenario: Reset stamps
        Given I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob"
        And I am logged in with email "billybob@gmail.com" and password "bobbobbob"
        And I am located at Zachry
        And I go to the first art piece
        And I click "Check-in to this art piece"
        And I visit my stamps
        And I click "Clear my stamps"
        And I visit my profile
        Then I should not see "Zachry"

