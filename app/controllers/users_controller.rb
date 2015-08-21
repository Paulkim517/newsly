class UsersController < ApplicationController
  before_filter :authorize, only: [:show]

  #form to create user
  def new
    if current_user
      redirect_to user_path
    else
  	  @user = User.new
  	  render :new
    end
  end

  #creates new user in db
  def create
    if current_user
      redirect_to profile_path
    else
  	  @user = User.new(user_params)
      respond_to do |format|
  	    if @user.save
  		    session[:user_id] = @user.id
          #POST /user
          #POST /users.json
          # tell the UserMailer to send a welcome Email after save
          UserMailer.welcome_email(@user).deliver

    		  #redirect_to '/profile'
  		    redirect_to profile_path
  	    else
          flash[:error] = @user.errors.full_messages
  		    #redirect_to "/signup"
  		    redirect_to signup_path
  	    end
      end
    end
  end
 
  #show current_user
  def show
    @response = HTTParty.get('http://api.nytimes.com/svc/topstories/v1/national.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211')
  	@world = HTTParty.get('http://api.nytimes.com/svc/topstories/v1/world.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211')
    render :show
  end


  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  	end
end
