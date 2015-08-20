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
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end



