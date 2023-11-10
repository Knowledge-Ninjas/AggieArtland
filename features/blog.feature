Feature: Blog
    As a registered user,
    So that I can interact with the community,
    I want to have access to a blog.

Background: blog posts in database
Given the following blog posts exist:
    | title             | body |
    | Example           | example text|
    | question          | How do i do this?|
    | pls help          | help|
    | fun fact!         | 1 + 1 = 2|

    Scenario: Go to blog
        Given I am on the sign up page
        When I press 'Blog'
        Then I should be on the blog page

    Scenario: Create blog post
        Given I am logged in
        And I am on the blog page
        When I click 'Create New Post'
        Then I should be on the create blog page
        When I fill in "Title" with "new post!"
        And I fill in "Body" with "Trying this out"
        And I press "Create Blog post"
        Then I should see blog post "new post!"
        And I should see "Blog post was successfully created."

    Scenario: Update blog post
        Given I am logged in
        And I am on the blog page
        When I click blog post 'pls help'
        And I click 'Edit'
        Then I should be on the blog edit page 'pls help'
        When I fill in "Title" with "Nevermind!"
        And I fill in "Body" with "Thanks for the help"
        And I press "Update Blog post"
        Then I should see blog post "Nevermind!"
        And I should see "Blog post was successfully updated."

    Scenario: Delete blog post
        Given I am logged in
        And I am on the blog page
        When I click blog post 'fun fact!'
        And I click 'Edit'
        Then I should be on the blog edit page 'fun fact!'
        When I press 'Delete'
        Then I should see 'Blog post was successfully destroyed.'
        And I am on the blog page

    Scenario: View blog post
        Given I am logged in
        And I am on the blog page
        When I click blog post 'Example'
        Then I should see blog post 'Example'

    Scenario: Comment on post
        Given I am logged in
        And I am on the blog page
        And I am looking at a blog post
        When I fill in 'Comment' with 'example comment'
        And I press 'Comment'
        Then I should see a new comment 'example comment'

