class UsersController < ApplicationController

  def show
    @q = User.find(params[:id]).articles.ransack(params[:q])
    @pagy, @userArticles = pagy(@q.result, items: 4)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, images: [])
  end
end
