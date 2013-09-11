class Category < ActiveRecord::Base
  attr_readonly :articles_count
  has_many :articles

  validates :name, presence: true
end
