class ArticlesController < ApplicationController

  before_action :finde_article, only: [:show, :edit, :update, :destroy]


  def show
    #finde_article
  end

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #finde_article
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notic] = "article was successfully created"
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    #finde_article
    if @article.update(article_params)
      flash[:notic] = "Article was successfully updated"
      redirect_to @article
    else
      render "edit"
    end
  end



  def destroy
    @article.destroy
    flash[:notic] = "Article #{params[:id]} was successfully destroyed"
    redirect_to articles_path
  end


  private

  def finde_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end


end
