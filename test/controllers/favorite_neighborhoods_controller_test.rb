require "test_helper"

class FavoriteNeighborhoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_neighborhood = favorite_neighborhoods(:one)
  end

  test "should get index" do
    get favorite_neighborhoods_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_neighborhood_url
    assert_response :success
  end

  test "should create favorite_neighborhood" do
    assert_difference('FavoriteNeighborhood.count') do
      post favorite_neighborhoods_url, params: { favorite_neighborhood: { neighborhood_id: @favorite_neighborhood.neighborhood_id, user_id: @favorite_neighborhood.user_id } }
    end

    assert_redirected_to favorite_neighborhood_url(FavoriteNeighborhood.last)
  end

  test "should show favorite_neighborhood" do
    get favorite_neighborhood_url(@favorite_neighborhood)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_neighborhood_url(@favorite_neighborhood)
    assert_response :success
  end

  test "should update favorite_neighborhood" do
    patch favorite_neighborhood_url(@favorite_neighborhood), params: { favorite_neighborhood: { neighborhood_id: @favorite_neighborhood.neighborhood_id, user_id: @favorite_neighborhood.user_id } }
    assert_redirected_to favorite_neighborhood_url(@favorite_neighborhood)
  end

  test "should destroy favorite_neighborhood" do
    assert_difference('FavoriteNeighborhood.count', -1) do
      delete favorite_neighborhood_url(@favorite_neighborhood)
    end

    assert_redirected_to favorite_neighborhoods_url
  end
end
