
#When('I press {string}') do |string|
#    click_link(string)
#end
Given ('the following blog posts exist:') do |posts_table|
    posts_table.hashes.each do |post|
      BlogPost.create post
    end
end

Then('I should be on the blog page') do ||
    expect(page).to have_current_path(blog_index_path)
end

Given('I am on the blog page') do ||
    visit blog_index_path
end

Then('I should be on the create blog page') do ||
    expect(page).to have_current_path(blog_create_path)
end

When('I click blog post {string}') do |string|
    click_link(string)
end

Then('I should see blog post {string}') do |string|
    expect(page).to have_content(string)
end

