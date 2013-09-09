class Admin::ArticlesController < Admin::BaseAdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params.merge!(status: 1))
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_path }
      else
        format.text { "Occure Error while creating a new article" }
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :top, :category_id, :status)
  end
end
