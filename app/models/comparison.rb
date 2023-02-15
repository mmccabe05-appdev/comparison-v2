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
class Comparison < ApplicationRecord
  # belongs_to :user

  belongs_to(:user,  :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true )
  has_many(:likes,  :class_name => "Like", :foreign_key => "comparison_id", :dependent => :destroy )
  has_many(:comments,  :class_name => "Comment", :foreign_key => "comparison_id", :dependent => :destroy )
  belongs_to(:neighborhood_1,  :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_1_id" )
  belongs_to(:neighborhood_2,  :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_2_id" )

  has_many(:fans,  :through => :likes, :source => :user )
  has_one(:city_1,  :through => :neighborhood_1, :source => :city )
  has_one(:city_2,  :through => :neighborhood_2, :source => :city )

  validates(:user_id,  :presence => true )
  validates(:neighborhood_1_id,  :presence => true )
  validates(:neighborhood_2_id,  :presence => true )
end
