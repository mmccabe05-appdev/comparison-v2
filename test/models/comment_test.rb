# == Schema Information
#
# Table name: comments
#
#  id            :bigint           not null, primary key
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  commenter_id  :integer
#  comparison_id :bigint           not null
#
# Indexes
#
#  index_comments_on_comparison_id  (comparison_id)
#
# Foreign Keys
#
#  fk_rails_...  (comparison_id => comparisons.id)
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
