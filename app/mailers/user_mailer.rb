class UserMailer < ApplicationMailer
	default from: "newsly.corporate@gmail.com"

	def welcome_email(user)
		@user = user
		@url = 'http://www.google.com'
		mail(to: @user.email, subject: 'Welcome to Newsly!')
	end
end