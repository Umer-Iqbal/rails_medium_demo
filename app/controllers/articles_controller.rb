class ArticlesController < ApplicationController

  def index
    @q = Article.ransack(params[:q])
    @pagy, @articles = pagy(@q.result, items: 4)
  end
end
