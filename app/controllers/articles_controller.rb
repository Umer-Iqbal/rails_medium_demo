class ArticlesController < ApplicationController

  def index
    @q = Article.ransack(params[:q])
    @pagy, @articles = pagy(@q.result, items: 4)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash.notice = "Article saved successfully"
      redirect_to articles_path
    else
      if @article.title == "" or @article.body == ""
        flash.alert = "There must be some text in (Title and Body) and Thumbnail must be present"
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to user_path
    end
  end

  def destroy
    @article = Article.find (params[:id])
    @article.destroy
    redirect_to user_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :thumbnail)
  end

end
