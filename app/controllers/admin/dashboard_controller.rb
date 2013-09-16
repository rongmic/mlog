class Admin::DashboardController < Admin::BaseAdminController
  def index
    @articles_total = Article.all.count
    @articles_published = Article.published.count
  end
end
