class CreateFavoriteNeighborhoods < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_neighborhoods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :neighborhood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
