require "application_system_test_case"

class ArtPiecesTest < ApplicationSystemTestCase
  setup do
    @art_piece = art_pieces(:one)
  end

  test "visiting the index" do
    visit art_pieces_url
    assert_selector "h1", text: "Art pieces"
  end

  test "should create art piece" do
    visit art_pieces_url
    click_on "New art piece"

    fill_in "Address", with: @art_piece.address
    fill_in "Description", with: @art_piece.description
    fill_in "Latitude", with: @art_piece.latitude
    fill_in "Longitude", with: @art_piece.longitude
    fill_in "Name", with: @art_piece.name
    click_on "Create Art piece"

    assert_text "Art piece was successfully created"
    click_on "Back"
  end

  test "should update Art piece" do
    visit art_piece_url(@art_piece)
    click_on "Edit this art piece", match: :first

    fill_in "Address", with: @art_piece.address
    fill_in "Description", with: @art_piece.description
    fill_in "Latitude", with: @art_piece.latitude
    fill_in "Longitude", with: @art_piece.longitude
    fill_in "Name", with: @art_piece.name
    click_on "Update Art piece"

    assert_text "Art piece was successfully updated"
    click_on "Back"
  end

  test "should destroy Art piece" do
    visit art_piece_url(@art_piece)
    click_on "Destroy this art piece", match: :first

    assert_text "Art piece was successfully destroyed"
  end
end
