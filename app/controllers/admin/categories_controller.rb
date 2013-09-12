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
        @categories = Category.all
        format.js
        format.html { render :new }
      else
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
      else

      end
    end
  end

  def destroy
    result = @category.destroy ? 1 : 0;
    respond_to do |format|
      format.json { render json: result }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
