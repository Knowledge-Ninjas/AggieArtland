Given('I have signed up as an admin with email {string}, name {string}, and password {string}') do |email, name, password|
    FactoryBot.create(:admin_user, email: email, name: name, password: password)
end
  
When('I press on Map') do |button|
    click_link(button)
end

When('I am in the Map Page') do
    visit map_path
end

When('I press on {string}') do |button|
    click_link(button)
end

Then('I should be on the map page') do
    visit map_path
end

Then('I should be on the Art Piece page') do
    visit art_pieces_path
end

Then('I should be on the Admin Panel page') do
    visit admin_panel_users_path
end

When('I am on Index Page') do
    visit map_path
end

Then('I should not see Admin Panel button') do 
    expect(page).not_to have_content('ADMIN PANEL')
end
