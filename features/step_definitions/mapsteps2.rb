require "application_system_test_case"

class ArtPiecesTest < ApplicationSystemTestCase
  # This setup block will run before each test, setting up any necessary state.
  setup do
    @art_piece = art_pieces(:one)
  end

  # This test simulates a user browsing the interactive map.
  test "visiting the index" do
    visit art_pieces_url
    assert_selector "h1", text: "Art Pieces"
  end

  # This test simulates an administrator creating a new art piece.
  test "creating an Art Piece" do
    visit art_pieces_url
    click_on "New Art Piece"

    fill_in "Name", with: 'Test Art Piece'
    fill_in "Description", with: 'This is a test.'
    fill_in "Address", with: '123 Test St'
    fill_in "Latitude", with: '30.2672'
    fill_in "Longitude", with: '-97.7431'
    fill_in "Artist", with: 'Test Artist'
    
    click_on "Create Art Piece"

    assert_text "Art piece was successfully created"
  end

  # This test simulates an administrator updating an existing art piece.
  test "updating an Art Piece" do
    visit art_piece_url(@art_piece)
    click_on "Edit this art piece", match: :first

    fill_in "Name", with: @art_piece.name
    fill_in "Description", with: @art_piece.description
    fill_in "Address", with: @art_piece.address
    fill_in "Latitude", with: @art_piece.latitude
    fill_in "Longitude", with: @art_piece.longitude
    fill_in "Artist", with: @art_piece.artist
    
    click_on "Update Art Piece"

    assert_text "Art piece was successfully updated"
  end

  # This test simulates an administrator destroying an existing art piece.
  test "destroying an Art Piece" do
    visit art_piece_url(@art_piece)
    
    page.accept_confirm do
      click_on "Destroy this art piece", match: :first
    end

    assert_text "Art piece was successfully destroyed"
  end
end
