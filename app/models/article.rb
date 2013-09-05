class Article < ActiveRecord::Base
  belongs_to :category, counter_cache: :articles_count
  scope :published, -> { where( status: 1 ) }
end
