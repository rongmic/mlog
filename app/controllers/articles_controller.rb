class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.published.page(params[:page]).per(10)
    @categories = Category.all
  end

  def create
  end

  def show
  end

  def search
    @articles = Article.search(params[:s]).page(params[:page]).per(10)
    @categories = Category.all
    @search_key = params[:s]
    render 'index', search_key: @search_key
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
