require 'rails_helper'

RSpec.describe User, type: :model do
   describe User do 

 end


# it "returns a contact's full name as a string" do
#  user = User.new(first_name: 'Rakesh', last_name: 'Shrestha')
#  expect(user.full_name).to eq('Rakesh Shrestha')
# end


it "should not be valid without a password" do
 user = User.new password: nil, password_confirmation: nil
 user.should_not be_valid
end



# end 
end
