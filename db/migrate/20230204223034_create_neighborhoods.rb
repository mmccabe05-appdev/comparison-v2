class CreateNeighborhoods < ActiveRecord::Migration[6.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.text :description
      t.references :city, null: false, foreign_key: true
      t.float :lat, default: 0
      t.float :lng, default: 0
      t.integer :favorite_neighborhoods_count

      t.timestamps
    end
  end
end
