require "test_helper"

class NeighborhoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @neighborhood = neighborhoods(:one)
  end

  test "should get index" do
    get neighborhoods_url
    assert_response :success
  end

  test "should get new" do
    get new_neighborhood_url
    assert_response :success
  end

  test "should create neighborhood" do
    assert_difference('Neighborhood.count') do
      post neighborhoods_url, params: { neighborhood: { city_id: @neighborhood.city_id, favorite_neighborhoods_count: @neighborhood.favorite_neighborhoods_count, lat: @neighborhood.lat, lng: @neighborhood.lng, name: @neighborhood.name } }
    end

    assert_redirected_to neighborhood_url(Neighborhood.last)
  end

  test "should show neighborhood" do
    get neighborhood_url(@neighborhood)
    assert_response :success
  end

  test "should get edit" do
    get edit_neighborhood_url(@neighborhood)
    assert_response :success
  end

  test "should update neighborhood" do
    patch neighborhood_url(@neighborhood), params: { neighborhood: { city_id: @neighborhood.city_id, favorite_neighborhoods_count: @neighborhood.favorite_neighborhoods_count, lat: @neighborhood.lat, lng: @neighborhood.lng, name: @neighborhood.name } }
    assert_redirected_to neighborhood_url(@neighborhood)
  end

  test "should destroy neighborhood" do
    assert_difference('Neighborhood.count', -1) do
      delete neighborhood_url(@neighborhood)
    end

    assert_redirected_to neighborhoods_url
  end
end
