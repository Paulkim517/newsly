class SiteController < ApplicationController
	include HTTParty
	base_url 'http://api.nytimes.com/'

	def index(text)
	  options = { :query => {:status => text}, :basic_auth => @auth }
	  self.class.post('svc/topstories/v1/national.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211', options)
		render :index
	end

News.post('svc/topstories/v1/national.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211', :query => {:status => "It's an HTTParty and everyone is invited!"})

end
