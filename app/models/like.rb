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
class Like < ApplicationRecord
  # belongs_to :user_id
  # belongs_to :comparison_id

  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id" )
  belongs_to(:comparison, :required => true, :class_name => "Comparison", :foreign_key => "comparison_id", :counter_cache => true )

  validates(:user_id, :presence => true )
  validates(:comparison_id, :presence => true )
  validates(:comparison_id, :uniqueness => { :scope => ["user_id"], :message => "already liked"  })
end
