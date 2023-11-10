
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

