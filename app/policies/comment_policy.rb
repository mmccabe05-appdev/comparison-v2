class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    user == comment.commenter
  end
  def destroy?
    user == comment.commenter
  end
end
