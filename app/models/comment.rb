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
class Comment < ApplicationRecord
  # belongs_to :comparison
  belongs_to(:commenter, :required => true, :class_name => "User", :foreign_key => "commenter_id" )
  belongs_to(:comparison, :required => true, :class_name => "Comparison", :foreign_key => "comparison_id", :counter_cache => true )

  validates(:comparison_id, :presence => true )
  validates(:commenter_id, :presence => true )
  validates(:body, :presence => true )
end
