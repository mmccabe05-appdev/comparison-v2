class AddWikipediaUrLtoCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :wiki_url, :string
  end
end
