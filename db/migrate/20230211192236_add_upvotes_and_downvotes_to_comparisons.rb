class AddUpvotesAndDownvotesToComparisons < ActiveRecord::Migration[6.1]
  def change
    add_column :comparisons, :upvotes, :integer
    add_column :comparisons, :downvotes, :integer
  end
end
