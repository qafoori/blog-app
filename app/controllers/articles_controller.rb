class ArticlesController < ApplicationController

  before_action :find_article, only: %i[show edit update destroy]


  def show
    # find_article
  end

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # find_article
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'article was successfully created'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    # find_article
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article #{params[:id]} was successfully destroyed"
    redirect_to articles_path
  end


  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end


end
