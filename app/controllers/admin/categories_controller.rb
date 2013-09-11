class Admin::CategoriesController < Admin::BaseAdminController
  before_action :set_category, only: [:edit, :update, :show, :destroy]

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { render :new }
      else
      end
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
