class Article < ActiveRecord::Base
  belongs_to :category, counter_cache: :articles_count
  has_one :hitcount
  validates :title, presence: true

  scope :published, -> { where( status: 1 ).order('created_at desc') }

  def self.search query
    published.where("title like ?", "%#{query}%")
  end

  def self.most_viewed
    published.joins(:hitcount).order("count DESC").limit(5)
  end

  def previous_article
    self.class.published.first(conditions: ["title < ?", title], order: "created_at desc")
  end

  def next_article
    self.class.published.first(conditions: ["title > ?", title], order: "created_at desc")
  end
end
