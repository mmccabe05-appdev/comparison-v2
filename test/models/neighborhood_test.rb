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
require "test_helper"

class NeighborhoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
