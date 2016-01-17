class ArticlesController < ApplicationController
  #GET /articles
  def index
    #Todos los registros
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    #Encontrar un registro por su id
    @article = Article.find(params[:id])
  end

  #GET /articles/new
  def new
  	@article = Article.new
  end

  #EDIT /articles/:id/edit
  def edit
    @article = Article.find(params[:id])
  end

  #POST /articles
  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to @article
  	else
  		render :new
  	end  	
  end

  #PUT /articles/:id
  def update
    # UPDATE
    # @article.update_attributes({title: 'Nuevo titulo'})
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  #DELETE /article/:id
  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy # destroy elimina el objeto de la BD
  	redirect_to articles_path
  end
  private

  def article_params
    params.require(:article).permit(:title,:body)
  end
end
