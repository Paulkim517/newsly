require "httparty"

class SiteController < ApplicationController

include HTTParty
 
	def index
	 	# National News
	 	@response = HTTParty.get('http://api.nytimes.com/svc/topstories/v1/national.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211')
	 	# World News
	 	@world = HTTParty.get('http://api.nytimes.com/svc/topstories/v1/world.json?api-key=b7d44ad17cc1da6bd24cdfc172b20a81:5:72707211')
	 	# All News
	 	@both = @world['results'] + @response['results']
	 	@date = Time.now
	 	respond_to do |format|
	 		format.html{render :index}
	 		format.json{render json: @both}
	 	end
	end

	def current
	  ::Time.zone ? ::Time.zone.today : ::Date.today
	end

end
