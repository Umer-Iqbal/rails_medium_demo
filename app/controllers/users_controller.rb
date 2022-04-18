class UsersController < ApplicationController
  include Pagy::Backend

def show
    @userArticles = User.find(params[:id]).articles
    @q = @userArticles.ransack(params[:q])
    @pagy, @articles = pagy(@q.result, items: 4)
    # debugger
  end
end
