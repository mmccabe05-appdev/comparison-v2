class CreateComparisons < ActiveRecord::Migration[6.1]
  def change
    create_table :comparisons do |t|
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.integer :culinary_similarity, default: 0
      t.integer :transportation_similarity, default: 0
      t.integer :people_similarity, default: 0
      t.integer :built_environment_similarity, default: 0
      t.float :overall_similarity, default: 0
      t.integer :neighborhood_1_id, null: false
      t.integer :neighborhood_2_id, null: false
      t.float :net_comparison_score, default: 0
      t.integer :net_votes, default: 0
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
