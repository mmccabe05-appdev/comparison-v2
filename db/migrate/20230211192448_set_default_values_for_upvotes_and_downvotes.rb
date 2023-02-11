class SetDefaultValuesForUpvotesAndDownvotes < ActiveRecord::Migration[6.1]
  def change
    change_column_default :comparisons, :upvotes, 0
    change_column_default :comparisons, :downvotes, 0
  end
end
