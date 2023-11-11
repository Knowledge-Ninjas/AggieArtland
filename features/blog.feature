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

    Scenario: Create blog post as admin
        Given I am logged in as an admin
        And I am on the blog page
        When I click 'Create New Post'
        Then I should be on the create blog page
        When I fill in "Title" with "new post!"
        And I fill in "Body" with "Trying this out"
        And I press "Create Blog post"
        Then I should see blog post "new post!"
        And I should see "Blog post was successfully created."

    Scenario: Cannot create blog post if not admin
        Given I am logged in
        And I am on the blog page
        Then I should not see 'Create New Post'

    Scenario: Update blog post
        Given I am logged in as an admin
        And I am on the blog page
        When I click blog post 'pls help'
        And I click 'Edit'
        Then I should be on the blog edit page 'pls help'
        When I fill in "Title" with "Nevermind!"
        And I fill in "Body" with "Thanks for the help"
        And I press "Update Blog post"
        Then I should see blog post "Nevermind!"
        And I should see "Blog post was successfully updated."

    Scenario: Cannot update post if not admin
        Given I am logged in
        And I am on the blog page
        When I click blog post 'pls help'
        Then I should not see 'Edit'

    Scenario: Delete blog post
        Given I am logged in as an admin
        And I am on the blog page
        When I click blog post 'fun fact!'
        And I click 'Edit'
        Then I should be on the blog edit page 'fun fact!'
        When I press 'Delete'
        Then I should see 'Blog post was successfully destroyed.'
        And I am on the blog page

    Scenario: Cannot delete post if not admin
        Given I am logged in
        And I am on the blog page
        When I click blog post 'fun fact!'
        Then I should not see 'Delete'

    Scenario: View blog post
        Given I am logged in
        And I am on the blog page
        When I click blog post 'Example'
        Then I should see blog post 'Example'


