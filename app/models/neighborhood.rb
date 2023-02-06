class Neighborhood < ApplicationRecord
  # belongs_to :city


  belongs_to(:city, :required => true, :class_name => "City", :foreign_key => "city_id", :counter_cache => true )
  has_many(:favorite_neighborhoods, :class_name => "FavoriteNeighborhood", :foreign_key => "neighborhood_id", :dependent => :destroy )
  has_many(:comparisons_as_neighborhood_1, :class_name => "Comparison", :foreign_key => "neighborhood_1_id", :dependent => :destroy )
  has_many(:comparisons_as_neighborhood_2, :class_name => "Comparison", :foreign_key => "neighborhood_2_id", :dependent => :destroy )

  has_many(:fans, :through => :favorite_neighborhoods, :source => :user )
  has_many(:neighborhood_2s, :through => :comparisons_as_neighborhood_1, :source => :neighborhood_2 )
  has_many(:neighborhood_1s, :through => :comparisons_as_neighborhood_2, :source => :neighborhood_1 )

end
