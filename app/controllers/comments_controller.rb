class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy, :show]
  before_action :set_article
  before_action :authenticate_user!

  respond_to :html,:json

  def show    
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article = @article
    respond_to do |format|
      if @comment.save
        format.json {render :show, status: :created, location: @comment.article}
      else
        format.json{render json: @comment.erros, status: :unprocessable_entity}
      end
    end

    #@comment = current_user.comments.new(comment_params)
    #@comment.article = @article
    #@comment.save
    #respond_with(@comment)
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
