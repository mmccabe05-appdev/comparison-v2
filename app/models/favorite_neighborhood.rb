class FavoriteNeighborhood < ApplicationRecord
  # belongs_to :user
  # belongs_to :neighborhood


  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  belongs_to(:neighborhood, { :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_id", :counter_cache => true })

end
