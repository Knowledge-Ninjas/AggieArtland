Given /the following art pieces exist/ do |art_pieces_table|
    art_pieces_table.hashes.each do |art_piece|
      ArtPiece.create art_piece
    end
  end

Given('I visit my profile') do
    click_link("Profile")
end

Given('I click the first {string} link') do |string|
    first(:link, string).click
end

Given("I go to the first art piece") do
    step %(I click "Art Pieces")
    step %(I click the first "Show this art piece" link)
end

Given('my location is {string} {string}') do |string, string2|
    visit "/map/updateloc", :post, :latitude => string, :longitude => string2, :accuracy => 12
end

Given('I am located at Zachry') do
    visit "/dummyloc"
end
  
Given('I go to the second art piece') do
    visit "/art_pieces/2"
end

Then('I should not see {string}') do |text|
    expect(page).to_not have_content(text)
end