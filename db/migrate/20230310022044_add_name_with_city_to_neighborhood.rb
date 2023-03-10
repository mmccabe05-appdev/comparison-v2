class AddNameWithCityToNeighborhood < ActiveRecord::Migration[6.1]
  def change
    add_column :neighborhoods, :name_with_city, :string
  end
end
