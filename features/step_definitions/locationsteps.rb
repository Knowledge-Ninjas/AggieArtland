# Given('I am browsing the interactive map') do
#   # visit locations_path
# end

# Then('I should see all exhibits around my vicinity \(20m)') do
#   # expect(page).to have_content(ArtPiece.within_vicinity(20).map(&:name))
# end

# Given('I am viewing an exhibit on the interactive map') do
#   @art_piece = ArtPiece.first
#   visit art_piece_path(@art_piece)
# end

# When('I tap on the check-in button') do
#   #click_button 'Check-in'
# end

# Then('my visit to the exhibit should be recorded') do
#   # expect(Visit.where(user: current_user, art_piece: @art_piece)).to exist
# end

# Then('I should receive a virtual {string} or points') do |reward|
#   # expect(current_user.rewards).to include(reward)
# end

# Given('I am logged in as an administrator') do
#   @admin = User.create!(email: 'admin@example.com', password: 'password', admin: true)
#   login_as(@admin)
# end

# When('I navigate to the {string} page') do |page_name|
#   visit path_for(page_name)
# end

# When('I fill in the art piece details') do
#   fill_in 'Name', with: 'Mona Lisa'
#   fill_in 'Description', with: 'A beautiful painting by Leonardo da Vinci.'
#   fill_in 'Address', with: 'Louvre Museum, Paris'
#   fill_in 'Latitude', with: '48.8606'
#   fill_in 'Longitude', with: '2.3376'
#   fill_in 'Artist', with: 'Leonardo da Vinci'
# end

# When('I provide the coordinates of latitude and longitude') do
#   fill_in 'Latitude', with: '48.8606'
#   fill_in 'Longitude', with: '2.3376'
# end

# When('I submit the form') do
#   click_button 'Submit'
# end

# Then('the art piece should be added to the database') do
#   expect(ArtPiece.where(name: 'Mona Lisa')).to exist
# end

# Given('the app is open') do
#   visit root_path
# end

# When('I navigate to the map interface') do
#   click_link 'Map Interface'
# end

# Then('I should see an interactive map displaying the trail\'s locations and artists\' exhibits') do
#   expect(page).to have_selector('#map')
# end

# Given('I am viewing exhibits on the interactive map') do
#   visit locations_path # Assuming this is where your map is displayed.
# end

# When('I tap on the share button') do
#   # click_button 'Share'
# end

# Then('I should be able to share my art trail experience on my chosen social media platform') do
#   # Test social media share
# end