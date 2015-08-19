class NewsController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  
  def index
  	@news = News.all
  	render :index
  end

  def show
  	@article = News.find(params[:id])
  	render :show
  end
  
end
