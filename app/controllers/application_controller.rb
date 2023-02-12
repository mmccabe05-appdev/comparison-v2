class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def index
    render({ :template => "main_page.html.erb" })
  end
  
  def find_comparison
    render({:template=>"found_comparison.html.erb"})
  end
  
end
