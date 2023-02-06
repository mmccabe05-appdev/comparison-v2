# == Schema Information
#
# Table name: cities
#
#  id                  :bigint           not null, primary key
#  lat                 :float            default(0.0)
#  lng                 :float            default(0.0)
#  location            :string
#  name                :string
#  neighborhoods_count :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class City < ApplicationRecord


  has_many(:neighborhoods, :class_name => "Neighborhood", :foreign_key => "city_id", :dependent => :destroy )

  has_many(:comparisons_as_neighborhood_1s, :through => :neighborhoods, :source => :comparisons_as_neighborhood_1 )
  has_many(:comparisons_as_neighborhood_2s, :through => :neighborhoods, :source => :comparisons_as_neighborhood_2 )

end
