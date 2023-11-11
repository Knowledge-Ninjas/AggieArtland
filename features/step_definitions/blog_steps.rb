
#When('I press {string}') do |string|
#    click_link(string)
#end
Given ('the following blog posts exist:') do |posts_table|
    posts_table.hashes.each do |post|
      BlogPost.create post
    end
end

Then('I should be on the blog page') do ||
    expect(page).to have_current_path(blogs_path)
end

Given('I am on the blog page') do ||
    visit blogs_path
end

Then('I should be on the create blog page') do ||
    expect(page).to have_current_path(new_blog_path)
end

When('I click blog post {string}') do |string|
    click_link(string)
end

Then('I should see blog post {string}') do |string|
    expect(page).to have_content(string)
end


Then('I should be on the blog edit page {string}') do |string|
    expect(page). to have_current_path(edit_blog_path(BlogPost.find_by(title:string)))
end

When('I confirm deletion') do ||
    Turbo.session.drive
end

Given('I am logged in as an admin') do ||
    @test_user = FactoryBot.create(:admin_user)
    visit login_path
    fill_in 'Email', with: @test_user.email
    fill_in 'Password', with: @test_user.password
    click_button 'Log in'
end

