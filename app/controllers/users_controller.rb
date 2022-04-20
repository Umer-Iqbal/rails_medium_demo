class UsersController < ApplicationController

def show
    @user_articles = User.find(params[:id]).articles
    @q = @user_articles.ransack(params[:q])
    @pagy, @articles = pagy(@q.result, items: 4)
  end
end
