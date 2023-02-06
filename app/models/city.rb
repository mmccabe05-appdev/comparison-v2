class City < ApplicationRecord


  has_many(:neighborhoods, :class_name => "Neighborhood", :foreign_key => "city_id", :dependent => :destroy )

  has_many(:comparisons_as_neighborhood_1s, :through => :neighborhoods, :source => :comparisons_as_neighborhood_1 )
  has_many(:comparisons_as_neighborhood_2s, :through => :neighborhoods, :source => :comparisons_as_neighborhood_2 )

end
