class AddDescriptionToCityTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :description, :string

  end
end
