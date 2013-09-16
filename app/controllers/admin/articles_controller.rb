class Admin::ArticlesController < Admin::BaseAdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params.merge!({status: 1}))
    respond_to do |format|
      if @article.save
        Hitcount.create(article_id: @article.id)
        format.html { redirect_to admin_articles_path }
        format.text { "Hello" }
      else
        format.text { "Occure Error while creating a new article" }
      end
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_articles_path, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aritlce.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_path }
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
