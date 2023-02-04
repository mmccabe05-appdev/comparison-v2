class Comparison < ApplicationRecord
  # belongs_to :user

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  has_many(:likes, { :class_name => "Like", :foreign_key => "comparison_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "comparison_id", :dependent => :destroy })
  belongs_to(:neighborhood_1, { :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_1_id" })
  belongs_to(:neighborhood_2, { :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_2_id" })

  has_many(:fans, { :through => :likes, :source => :user })
  has_one(:city_1, { :through => :neighborhood_1, :source => :city })
  has_one(:city_2, { :through => :neighborhood_2, :source => :city })

  validates(:user_id, { :presence => true })
  validates(:neighborhood_1_id, { :presence => true })
  validates(:neighborhood_2_id, { :presence => true })
end
