class Article < ActiveRecord::Base
  belongs_to :category, counter_cache: :articles_count
  has_one :hitcount
  validates :title, presence: true

  scope :published, -> { where( status: 1 ) }

  def self.search query
    published.where("title like ?", "%#{query}%")
  end

  def self.most_viewed
    published.joins(:hitcount).order("count DESC").limit(5)
  end
end
