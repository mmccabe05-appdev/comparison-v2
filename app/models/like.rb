class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :comparison_id
end
