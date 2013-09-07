class Article < ActiveRecord::Base
  belongs_to :category, counter_cache: :articles_count
  has_one :hitcount
  scope :published, -> { where( status: 1 ) }

  def self.search query
    published.where("title like ?", "%#{query}%")
  end
end
