class Like < ApplicationRecord
  # belongs_to :user_id
  # belongs_to :comparison_id

  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id" )
  belongs_to(:comparison, :required => true, :class_name => "Comparison", :foreign_key => "comparison_id", :counter_cache => true )

  validates(:user_id, :presence => true )
  validates(:comparison_id, :presence => true )
  validates(:comparison_id, :uniqueness => { :scope => ["user_id"], :message => "already liked"  })
end
