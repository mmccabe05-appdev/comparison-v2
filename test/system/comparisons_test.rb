require "application_system_test_case"

class ComparisonsTest < ApplicationSystemTestCase
  setup do
    @comparison = comparisons(:one)
  end

  test "visiting the index" do
    visit comparisons_url
    assert_selector "h1", text: "Comparisons"
  end

  test "creating a Comparison" do
    visit comparisons_url
    click_on "New Comparison"

    fill_in "Body", with: @comparison.body
    fill_in "Built environment similarity", with: @comparison.built_environment_similarity
    fill_in "Comments count", with: @comparison.comments_count
    fill_in "Culinary similarity", with: @comparison.culinary_similarity
    fill_in "Likes count", with: @comparison.likes_count
    fill_in "Neighborhood 1", with: @comparison.neighborhood_1_id
    fill_in "Neighborhood 2", with: @comparison.neighborhood_2_id
    fill_in "Net comparison score", with: @comparison.net_comparison_score
    fill_in "Net votes", with: @comparison.net_votes
    fill_in "Overall similarity", with: @comparison.overall_similarity
    fill_in "People similarity", with: @comparison.people_similarity
    fill_in "Transportation similarity", with: @comparison.transportation_similarity
    fill_in "User", with: @comparison.user_id
    click_on "Create Comparison"

    assert_text "Comparison was successfully created"
    click_on "Back"
  end

  test "updating a Comparison" do
    visit comparisons_url
    click_on "Edit", match: :first

    fill_in "Body", with: @comparison.body
    fill_in "Built environment similarity", with: @comparison.built_environment_similarity
    fill_in "Comments count", with: @comparison.comments_count
    fill_in "Culinary similarity", with: @comparison.culinary_similarity
    fill_in "Likes count", with: @comparison.likes_count
    fill_in "Neighborhood 1", with: @comparison.neighborhood_1_id
    fill_in "Neighborhood 2", with: @comparison.neighborhood_2_id
    fill_in "Net comparison score", with: @comparison.net_comparison_score
    fill_in "Net votes", with: @comparison.net_votes
    fill_in "Overall similarity", with: @comparison.overall_similarity
    fill_in "People similarity", with: @comparison.people_similarity
    fill_in "Transportation similarity", with: @comparison.transportation_similarity
    fill_in "User", with: @comparison.user_id
    click_on "Update Comparison"

    assert_text "Comparison was successfully updated"
    click_on "Back"
  end

  test "destroying a Comparison" do
    visit comparisons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comparison was successfully destroyed"
  end
end
