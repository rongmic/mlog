class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :status
      t.boolean :top

      t.timestamps
    end
  end
end
