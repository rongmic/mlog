class CreateSiteConfigs < ActiveRecord::Migration
  def change
    create_table :site_configs do |t|
      t.string :site_name
      t.integer :admin_page_size
      t.integer :front_page_size
      t.boolean :article_top_func, default: false

      t.timestamps
    end
  end
end
