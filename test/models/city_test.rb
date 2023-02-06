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
require "test_helper"

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
