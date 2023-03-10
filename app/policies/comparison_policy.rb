class ComparisonPolicy
  attr_reader :user, :comparison

  def initialize(user, comparison)
    @user = user
    @comparison = comparison
  end

  def edit?
    user == comparison.user
  end
  def destroy?
    user == comparison.user
  end
end
