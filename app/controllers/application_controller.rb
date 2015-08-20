class ApplicationController < ActionController::Base
# POST /users
# POST /users.json
def create
	@user = User.new(params[:user])

	respond_to do |format|
		if @user.save
			# Tell the UserMAiler to send a welcome email after save
			UserMailer.welcome_email(@user).deliver

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.friendly.find(session[:user_id]) if session[:user_id]
  end

  def require_auth
        @current_user ||= User.friendly.find(session[:user_id]) if session[:user_id]
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

  def authorize
  	unless current_user
  		redirect_to login_path
  	end
  end
  
end



