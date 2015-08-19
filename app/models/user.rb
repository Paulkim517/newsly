class User < ActiveRecord::Base
	has_many :news, dependent: :destroy
	has_secure_password
end
