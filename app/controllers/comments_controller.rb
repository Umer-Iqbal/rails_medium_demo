class CommentsController < ApplicationController

  before_action :set_article

  def index
    @comments = Comment.all
  end

  def create
    @comment = @article.comments.new(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to article_path(@article)
    end
  end

  def edit
    @comment = @article.comments.find(params[:id])
    render layout: "new_article"
  end

  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    end
  end

  def destroy
    @comment = @article.comments.find(params[:comment_id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find params[:article_id]
  end
end