json.extract! comment, :id, :body, :commenter_id, :comparison_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
