class AddWikiUrlToNeighborhoods < ActiveRecord::Migration[6.1]
  def change
    add_column :neighborhoods, :wiki_url, :string
  end
end
