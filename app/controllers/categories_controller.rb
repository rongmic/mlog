class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order("articles_count desc")
  end

  def show
    @articles = @category.articles.published
    @categories = Category.all
    @most_viewed_articles = Article.most_viewed
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
