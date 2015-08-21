require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	   
	   describe "GET #new" do
     it "should assign @user" do
       get :new
       expect(assigns(:user)).to be_instance_of(User)
     end

     it "should render the :new view" do
       get :new
       expect(response).to render_template(:new)
     end
   end


 end

	
end
