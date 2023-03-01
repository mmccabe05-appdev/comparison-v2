class AddDisplayNametoCitiesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :display_name, :string

  end
end
