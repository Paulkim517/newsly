class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_auth
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        if !current_user
          redirect_to root_path
        end
  end

  helper_method :current_user
  helper_method :require_auth
  helper_method :results
  helper_method :geo
  
  def results
    @results = HTTParty.get('http://api.nytimes.com/svc/topstories/v1/national.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211')  
  end

  def geo
    @geo = results['results'][0]['geo_facet'][0]
    
  end 

end
