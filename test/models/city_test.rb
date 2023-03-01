# == Schema Information
#
# Table name: cities
#
#  id                  :bigint           not null, primary key
#  description         :string
#  display_name        :string
#  lat                 :float            default(0.0)
#  lng                 :float            default(0.0)
#  location            :string
#  name                :string
#  neighborhoods_count :integer          default(0)
#  state               :string
#  wiki_url            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require "test_helper"

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
