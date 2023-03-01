class AddStateToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :state, :string
  end
end
