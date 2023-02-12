class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def index
    render({ :template => "main_page.html.erb" })
  end
    
end
