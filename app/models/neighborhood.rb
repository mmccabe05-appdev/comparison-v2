# == Schema Information
#
# Table name: neighborhoods
#
#  id                           :bigint           not null, primary key
#  description                  :text
#  favorite_neighborhoods_count :integer
#  lat                          :float            default(0.0)
#  lng                          :float            default(0.0)
#  name                         :string
#  wiki_url                     :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  city_id                      :bigint           not null
#
# Indexes
#
#  index_neighborhoods_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#
class Neighborhood < ApplicationRecord

  belongs_to(:city, :required => true, :class_name => "City", :foreign_key => "city_id", :counter_cache => true ) 
  has_many(:favorite_neighborhoods, :class_name => "FavoriteNeighborhood", :foreign_key => "neighborhood_id", :dependent => :destroy )
  has_many(:comparisons_as_neighborhood_1, :class_name => "Comparison", :foreign_key => "neighborhood_1_id", :dependent => :destroy )
  has_many(:comparisons_as_neighborhood_2, :class_name => "Comparison", :foreign_key => "neighborhood_2_id", :dependent => :destroy )

  has_many(:fans, :through => :favorite_neighborhoods, :source => :user )
  has_many(:neighborhood_2s, :through => :comparisons_as_neighborhood_1, :source => :neighborhood_2 )
  has_many(:neighborhood_1s, :through => :comparisons_as_neighborhood_2, :source => :neighborhood_1 )

  def name_with_city 
    "#{self.city.display_name} - #{self.name}"
  end 

  def all_comparisons_for_given_neighborhood
    self.comparisons_as_neighborhood_1.or(self.comparisons_as_neighborhood_2)
  end
end
