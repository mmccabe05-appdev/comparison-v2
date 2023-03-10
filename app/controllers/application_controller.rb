class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def google_api_key
    return ENV.fetch("GMAPS_KEY")
  end

  def index
    render({ :template => "main_page.html.erb" })
  end

  def profile
    @user = User.where(username: params.fetch("username")).first
    @comparisons = Comparison.includes(:user).includes(:neighborhood_1).includes(:neighborhood_2).includes(:city_1).includes(:city_2).where(user: @user).order(net_comparison_score: :desc)
    @user.karma = @comparisons.sum(:net_comparison_score)
    @user.save
    render({ :template => "users/show.html.erb" })
  end

  def top_users
    # refresh Karma scores for all users
    # active record query for users desc, return just top 50

    # @comparisons = Comparison.where(user: @user).order(net_comparison_score: :desc)
    # @user.karma = @comparisons.sum(:net_comparison_score)
    # @user.save

    @top_karma_users = User.all.order(karma: :desc).first(50)
    # @top_contributions_users = User.where(username: "matt").first.comparisons.size

    @top_contributions_users = User.all.order(comparisons_count: :desc).first(50)
  
    render({ :template => "users/top_users.html.erb" })
  end
  
  def find_comparison

    if City.find(params.fetch("query_city")) == nil || Neighborhood.find(params.fetch("query_neighborhood")) == nil 
      redirect_to("/", alert: "Gotta choose a valid neighborhood and city!" )

    else
 
      @query_city = City.find(params.fetch("query_city"))
      @query_neighborhood = Neighborhood.find(params.fetch("query_neighborhood"))

      if @query_neighborhood.city != @query_city
        
        @all_comparisons_for_query_neighborhood = @query_neighborhood.all_comparisons_for_given_neighborhood        

        @comparisons_limited_to_target_city = @all_comparisons_for_query_neighborhood.
          where(city_1: { id: @query_city.id }).
          or(
            @all_comparisons_for_query_neighborhood.where(city_2: { id: @query_city.id })
          ).joins(:city_1, :city_2)

          @winning_comparison = @comparisons_limited_to_target_city.order(net_comparison_score: :desc).first

          @comparisons_except_in_target_city = @all_comparisons_for_query_neighborhood.
          where.not(city_1: { id: @query_city.id }).
          and(
            @all_comparisons_for_query_neighborhood.where.not(city_2: { id: @query_city.id })
          ).joins(:city_1, :city_2)
  
        
        render({:template=>"found_comparison.html.erb"})
        else
          redirect_to("/", alert: "Can't compare a neighborhood within its own city!" )
        end
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to "/", alert: "Gotta choose a valid neighborhood and city!" 
  end 
end
