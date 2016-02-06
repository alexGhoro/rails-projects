class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_article
  before_action :authenticate_user!

  respond_to :html

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article = @article
    @comment.save
    respond_with(@comment.article)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment.article)
  end

  def destroy
    @comment.destroy
    respond_with(@article)
  end

  private

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :body)
    end
end
