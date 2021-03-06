class CategoriesController < ApplicationController

  before_action :require_admin, except: %i[index show]

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(categories_params)
      flash[:notice] = 'That category was updated'
      redirect_to @category
    else
      render 'edit'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to @category
    else
      render 'new'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 3)
  end

  private

  def categories_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = 'Only admins can perform that action'
      redirect_to categories_path
    end
  end

end
