Given('I am browsing the interactive map') do
    visit interactive_map_path  # Assuming you have a route named interactive_map_path
  end
  
  Then('I should see all exhibits around my vicinity (20m)') do
    # Assuming there's a method to retrieve exhibits based on vicinity
    expect(page).to have_content('List of exhibits around your vicinity') 
  end
  
  Given('I am viewing an exhibit on the interactive map') do
    # Assuming you have a specific exhibit ID (e.g., @exhibit_id)
    visit exhibit_path(@exhibit_id) # Assuming exhibit_path is the route to view a specific exhibit
  end
  
  When('I tap on the check-in button') do
    click_button('Check-In') # Assuming there's a button with the text 'Check-In'
  end
  
  Then('my visit to the exhibit should be recorded') do
    # Assuming there's a method to record visits to an exhibit
    expect(Visit.where(exhibit_id: @exhibit_id, user_id: @user_id)).to exist
  end
  
  Then('I should receive a virtual {string} or points') do |points|
    # Assuming there's a method to calculate and display points
    expect(page).to have_content("You received #{points} points")
  end
  
  Given('I am logged in as an administrator') do
    # Assuming there's a method to log in as an administrator
    log_in_as_administrator # You should define this method in your step_definitions
  end
  
  When('I navigate to the {string} page') do |page_name|
    visit page_path(page_name) # Assuming you have named routes for pages
  end
  
  When('I fill in the art piece details') do
    fill_in 'Name', with: 'Art Piece Name' # Assuming there's a field named 'Name'
    fill_in 'Description', with: 'Art Piece Description' # Assuming there's a field named 'Description'
    # Add other fields as needed
  end
  
  When('I provide the coordinates of latitude and longitude') do
    fill_in 'Latitude', with: '123.456' # Assuming there's a field named 'Latitude'
    fill_in 'Longitude', with: '789.012' # Assuming there's a field named 'Longitude'
  end
  
  When('I submit the form') do
    click_button 'Submit' # Assuming there's a button named 'Submit'
  end
  
  Then('the art piece should be added to the database') do
    expect(ArtPiece.last).to have_attributes(
      name: 'Art Piece Name',
      description: 'Art Piece Description',
      latitude: '123.456',
      longitude: '789.012'
    )
  end
  
  # Add more step definitions as needed for other test cases.
  