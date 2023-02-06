# == Schema Information
#
# Table name: favorite_neighborhoods
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_favorite_neighborhoods_on_neighborhood_id  (neighborhood_id)
#  index_favorite_neighborhoods_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (neighborhood_id => neighborhoods.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class FavoriteNeighborhoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
