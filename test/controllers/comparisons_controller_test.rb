require "test_helper"

class ComparisonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comparison = comparisons(:one)
  end

  test "should get index" do
    get comparisons_url
    assert_response :success
  end

  test "should get new" do
    get new_comparison_url
    assert_response :success
  end

  test "should create comparison" do
    assert_difference('Comparison.count') do
      post comparisons_url, params: { comparison: { body: @comparison.body, built_environment_similarity: @comparison.built_environment_similarity, comments_count: @comparison.comments_count, culinary_similarity: @comparison.culinary_similarity, likes_count: @comparison.likes_count, neighborhood_1_id: @comparison.neighborhood_1_id, neighborhood_2_id: @comparison.neighborhood_2_id, net_comparison_score: @comparison.net_comparison_score, net_votes: @comparison.net_votes, overall_similarity: @comparison.overall_similarity, people_similarity: @comparison.people_similarity, transportation_similarity: @comparison.transportation_similarity, user_id: @comparison.user_id } }
    end

    assert_redirected_to comparison_url(Comparison.last)
  end

  test "should show comparison" do
    get comparison_url(@comparison)
    assert_response :success
  end

  test "should get edit" do
    get edit_comparison_url(@comparison)
    assert_response :success
  end

  test "should update comparison" do
    patch comparison_url(@comparison), params: { comparison: { body: @comparison.body, built_environment_similarity: @comparison.built_environment_similarity, comments_count: @comparison.comments_count, culinary_similarity: @comparison.culinary_similarity, likes_count: @comparison.likes_count, neighborhood_1_id: @comparison.neighborhood_1_id, neighborhood_2_id: @comparison.neighborhood_2_id, net_comparison_score: @comparison.net_comparison_score, net_votes: @comparison.net_votes, overall_similarity: @comparison.overall_similarity, people_similarity: @comparison.people_similarity, transportation_similarity: @comparison.transportation_similarity, user_id: @comparison.user_id } }
    assert_redirected_to comparison_url(@comparison)
  end

  test "should destroy comparison" do
    assert_difference('Comparison.count', -1) do
      delete comparison_url(@comparison)
    end

    assert_redirected_to comparisons_url
  end
end
