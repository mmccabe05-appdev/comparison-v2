# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  comparison_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_likes_on_comparison_id  (comparison_id)
#  index_likes_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (comparison_id => comparisons.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
