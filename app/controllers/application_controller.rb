class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def index
    render({ :template => "main_page.html.erb" })
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
