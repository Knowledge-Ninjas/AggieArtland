# In your Cucumber step definition
Given('I am logged in') do
    @test_user = FactoryBot.create(:user)
    visit login_path
    fill_in 'Email', with: @test_user.email
    fill_in 'Password', with: @test_user.password
    click_button 'Log in'
  end
  
And('I am on the user profile page') do
    visit profile_path(@test_user.id)
end
When('I press the {string} link') do |string|
    click_link(string)
end

Then('I should be on the map page') do ||
    expect(page).to have_current_path(map_path)
end

Then('I should be on the art pieces page') do ||
    expect(page).to have_current_path(art_pieces_path)
end

Then('I should be on the edit page') do ||
    expect(page).to have_current_path(edit_profile_path(@test_user.id))
end
