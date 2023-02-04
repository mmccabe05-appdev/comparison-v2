class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :location
      t.float :lat, default: 0
      t.float :lng, default: 0
      t.integer :neighborhoods_count, default: 0

      t.timestamps
    end
  end
end
