Feature: Authentication System
    As a registered user,
    So that I can access the resources of the website securely,
    I want to log into the website with my email and password.

    Scenario: Navigate to Create Account
        Given I am on the login page
        When I click on the sign up button
        Then I should be on the sign up page

    Scenario: Create Account
        Given I am on the sign up page
        When I fill in "Email" with "billybob@gmail.com"
        And I fill in "Name" with "Billy Bob"
        And I fill in "Password" with "bobbobbob"
        And I fill in "Password confirmation" with "bobbobbob"
        And I press "Sign Up"
        Then I should be on the user page
        And I should see "Billy Bob"
        And I should see "billybob@gmail.com"
