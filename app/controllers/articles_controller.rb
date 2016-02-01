class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:index, :new, :create]
  #GET /articles
  def index
    #Todos los registros
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    @article.update_visits_count
  end

  #GET /articles/new
  def new
  	@article = Article.new
  end

  #EDIT /articles/:id/edit
  def edit

  end

  #POST /articles
  def create
  	@article = current_user.articles.new(article_params)
  	if @article.save
  		redirect_to @article
  	else
  		render :new
  	end
  end

  #PUT /articles/:id
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  #DELETE /article/:id
  def destroy
  	@article.destroy # destroy elimina el objeto de la BD
  	redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:body)
  end
end
