class UsersController < ApplicationController

  def show
    @userArticles = User.find(params[:id]).articles
    @q = @userArticles.ransack(params[:q])
    @pagy, @articles = pagy(@q.result, items: 4)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, images: [])
  end
end
