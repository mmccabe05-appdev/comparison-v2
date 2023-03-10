# == Schema Information
#
# Table name: comparisons
#
#  id                           :bigint           not null, primary key
#  body                         :string
#  built_environment_similarity :integer          default(0)
#  comments_count               :integer          default(0)
#  culinary_similarity          :integer          default(0)
#  downvotes                    :integer          default(0)
#  likes_count                  :integer          default(0)
#  net_comparison_score         :float            default(0.0)
#  net_votes                    :integer          default(0)
#  overall_similarity           :float            default(0.0)
#  people_similarity            :integer          default(0)
#  transportation_similarity    :integer          default(0)
#  upvotes                      :integer          default(0)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  neighborhood_1_id            :integer          not null
#  neighborhood_2_id            :integer          not null
#  user_id                      :bigint           not null
#
# Indexes
#
#  index_comparisons_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ComparisonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
