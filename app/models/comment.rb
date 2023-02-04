class Comment < ApplicationRecord
  # belongs_to :comparison
  belongs_to(:commenter, { :required => true, :class_name => "User", :foreign_key => "commenter_id" })
  belongs_to(:comparison, { :required => true, :class_name => "Comparison", :foreign_key => "comparison_id", :counter_cache => true })

  validates(:comparison_id, { :presence => true })
  validates(:commenter_id, { :presence => true })
  validates(:body, { :presence => true })
end
