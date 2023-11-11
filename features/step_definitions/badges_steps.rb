Given /the following badges exist/ do |badges_table|
    badges_table.hashes.each do |badge|
      Badge.create badge
    end
  end

Given('I visit my badges') do
    step %(I visit my profile)
    click_link("See all badges")
end

Given("I go to badge {int}") do |id|
    visit "/badges/" + id.to_s
end

Given("I check in to art piece {int}") do |id|
    step %(I have signed up with email "billybob@gmail.com", name "Billy Bob", and password "bobbobbob")
    step %(I am logged in with email "billybob@gmail.com" and password "bobbobbob")
    step %(I am located at Zachry)
    visit "/art_pieces/" + id.to_s
    step %(I click "Check-in to this art piece")
end