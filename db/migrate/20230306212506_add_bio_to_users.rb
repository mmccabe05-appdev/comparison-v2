class AddBioToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :string, :default => " "
    add_column :users, :karma, :float, :default => "0.0"
  end
end
