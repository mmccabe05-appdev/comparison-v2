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

      @all_comparisons_for_query_neighborhood = @query_neighborhood.comparisons_as_neighborhood_1.or(@query_neighborhood.comparisons_as_neighborhood_2)


      @comparisons_limited_to_target_city = @all_comparisons_for_query_neighborhood.where(:city_1=>@query_city).or(@all_comparisons_for_query_neighborhood.where(:city_2=>@query_city)) 
      
      render({:template=>"found_comparison.html.erb"})
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to "/", alert: "Gotta choose a valid neighborhood and city!" 
  end 
end
