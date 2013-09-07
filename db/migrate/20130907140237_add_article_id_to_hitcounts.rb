class AddArticleIdToHitcounts < ActiveRecord::Migration
  def change
    add_column :hitcounts, :article_id, :integer
  end
end
