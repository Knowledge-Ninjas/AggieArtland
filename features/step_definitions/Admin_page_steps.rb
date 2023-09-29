Given('I am logged in as an admin') do
  # Write code here to log in as an admin user
  login_as_admin
end
When('I open the admin page') do
  # Write code here to open the admin page
  visit admin_page_path
end
Then('I should be able to view all the details of the current art pieces') do
  # Write code here to verify that all art pieces' details are visible
  expect(page).to have_content('Art Piece Details')
end
Given('I am in the Index page') do
  # Write code here to navigate to the Index page
  visit index_page_path
end
When('I click on the new Location button') do
  # Write code here to click on the new Location button
  click_button 'New Location'
end
Then('I should be redirected to the page') do
  # Write code here to verify the redirection to the expected page
  expect(page).to have_current_path(new_location_page_path)
end
Then('I should be able to input the details of the new Art Piece') do
  # Write code here to input the details of the new Art Piece
  fill_in 'Location Name', with: 'New Location'
  fill_in 'Address', with: '123 Main St'
  click_button 'Save'
end
Then('it should be updated in the database within {int} seconds') do |int|
  # Write code here to verify that the new Art Piece is updated in the database within the specified time
  sleep(int)
  expect(Location.find_by(name: 'New Location')).not_to be_nil
end
Given('I am in the show location page') do
  # Write code here to navigate to the show location page
  visit location_page_path(location_id)
end
When('I click the edit location button') do
  # Write code here to click the edit location button
  click_button 'Edit Location'
end
Then('I should be redirected to the updating page') do
  # Write code here to verify the redirection to the updating page
  expect(page).to have_current_path(update_location_page_path(location_id))
end
Then('I should be able to change any aspect of the Art Piece') do
  # Write code here to change any aspect of the Art Piece
  fill_in 'Location Name', with: 'Updated Location'
  click_button 'Save'
end
Given('I am on the show location page') do
  # Write code here to navigate to the show location page
  visit location_page_path(location_id)
end
When('I click on the delete location button') do
  # Write code here to click on the delete location button
  click_button 'Delete Location'
end
Then('it should be deleted from the database within {int} seconds') do |int|
  # Write code here to verify that the location is deleted from the database within the specified time
  sleep(int)
  expect(Location.find_by(id: location_id)).to be_nil
end
Given('I am on the Index page') do
  # Write code here to navigate to the Index page
  visit index_page_path
end
When('I click on show location') do
  # Write code here to click on show location
  click_link 'Show Location'
end
Then('I should be able to see all the details of a certain art piece') do
  # Write code here to verify that all details of a certain art piece are visible
  expect(page).to have_content('Location Details')
end