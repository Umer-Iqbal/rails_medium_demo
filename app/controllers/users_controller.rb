class UsersController < ApplicationController
  include Pagy::Backend

  def index
    # @articles = Article.all

    # Article.ransack(params[:q])
    # @pagy, @articles = pagy(@q.result, items: 4)

    # @pagy, @articles = pagy(Article.all, items: 4)
    # debugger
  end

  def show
    @userArticles = User.find(params[:id]).articles
    @q = @userArticles.ransack(params[:q])
    @pagy, @articles = pagy(@q.result, items: 4)
    # debugger
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
    debugger
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, images: [])
  end
end
