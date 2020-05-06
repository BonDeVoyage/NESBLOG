class PagesController < ApplicationController
  def index
	@articles = Article.order(created_at: :desc).paginate(:page => params[:page], per_page: 2)
  end
  
  def articles
  end
  
  def about
  end
end
