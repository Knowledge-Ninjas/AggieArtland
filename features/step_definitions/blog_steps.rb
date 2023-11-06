
#When('I press {string}') do |string|
#    click_link(string)
#end
Then('I should be on the blog page') do ||
    expect(page).to have_current_path(new_blog_path)
end

Given('I am on the blog page') do ||
    visit new_blog_path
end

Then('I should be on the create blog page') do ||
    expect(page).to have_current_path(blog_create_path)
end

When('I click blog post {string}') do |string|
    pending
end
