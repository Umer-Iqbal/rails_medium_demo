class TopicsController < ApplicationController
  layout 'new_article'
  def index
    @topics = Topic.all
    @pagy, @articles = pagy(@topics, items: 4)
  end
  def new
    @topic = Topic.find(params[:id])
    @article = Article.new(title: @topic.title, body: @topic.description )
  end
  def create

  end
end