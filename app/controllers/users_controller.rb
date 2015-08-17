class UsersController < ApplicationController
  #form to create user
  def new
    if current_user
      redirect_to root_path
    else
  	  @user = User.new
  	  render :new
    end
  end

  #creates new user in db
  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id
  		#redirect_to '/root'
  		redirect_to root_path
  	else
  		#redirect_to "/signup"
  		redirect_to signup_path
  	end

  end
  
  #show current_user
  def show
  	render :show
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end

end
