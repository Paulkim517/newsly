class NewsController < ApplicationController
  def show
  	@news = News.all 
  	render :show
  end

  def destroy
  end
end
