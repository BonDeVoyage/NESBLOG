class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end
  
  def new
	@article = Article.new
  end
  
  def create
	@article = Article.new(article_params)
	@article.user = current_user
	if @article.save
		redirect_to article_path(@article)
	else
		render 'new'
	end
  end
  
  def show
	@comments = @article.comments.order(created_at: :desc).paginate(:page => params[:page], per_page: 2)
  end
  
  def edit
  end
  
  def update
	if @article.update(article_params)
		redirect_to article_path(@article)
	else
		render 'edit'
	end
  end
  
  def destroy
	@article.destroy
	redirect_to articles_path
  end
  
  private
	def article_params
		params.require(:article).permit(:title, :text)
	end
  
	def set_article
		@article = Article.find(params[:id])
	end
end
