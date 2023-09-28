Given('I am on the login page') do
    visit login_path
end

When('I click on the sign up button') do
    click_link("Sign up")
end

Then('I should be on the sign up page') do
    visit signup_path
end

Given('I am on the sign up page') do
    visit signup_path
end

When('I fill in {string} with {string}') do |field, value|
    fill_in(field, with: value)
end

When('I press {string}') do |button|
    click_button(button)
end

Then('I should be on the user page') do
    visit user_path
end

Then('I should see {string}') do |text|
    page.should have_content(text)
end