require "application_system_test_case"

class FavoriteNeighborhoodsTest < ApplicationSystemTestCase
  setup do
    @favorite_neighborhood = favorite_neighborhoods(:one)
  end

  test "visiting the index" do
    visit favorite_neighborhoods_url
    assert_selector "h1", text: "Favorite Neighborhoods"
  end

  test "creating a Favorite neighborhood" do
    visit favorite_neighborhoods_url
    click_on "New Favorite Neighborhood"

    fill_in "Neighborhood", with: @favorite_neighborhood.neighborhood_id
    fill_in "User", with: @favorite_neighborhood.user_id
    click_on "Create Favorite neighborhood"

    assert_text "Favorite neighborhood was successfully created"
    click_on "Back"
  end

  test "updating a Favorite neighborhood" do
    visit favorite_neighborhoods_url
    click_on "Edit", match: :first

    fill_in "Neighborhood", with: @favorite_neighborhood.neighborhood_id
    fill_in "User", with: @favorite_neighborhood.user_id
    click_on "Update Favorite neighborhood"

    assert_text "Favorite neighborhood was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorite neighborhood" do
    visit favorite_neighborhoods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite neighborhood was successfully destroyed"
  end
end
