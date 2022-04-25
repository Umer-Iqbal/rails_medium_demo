class UsersController < ApplicationController

  def show
    @userArticles = User.find(params[:id]).articles
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, images: [])
  end
end
