class CommentsController < ApplicationController

  before_action :set_article

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.new(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find params[:article_id]
  end
end