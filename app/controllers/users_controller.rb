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
    redirect_to user_path(user)
   else
    flash[:error] =  user.errors.full_messages
    redirect_to signup_path

  end
end





  
  #show current_user
  def show
        @response = HTTParty.get('http://api.nytimes.com/svc/topstories/v1/national.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211')
  	render :show
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  	end

end
