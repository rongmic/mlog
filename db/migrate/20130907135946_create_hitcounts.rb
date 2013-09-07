class CreateHitcounts < ActiveRecord::Migration
  def change
    create_table :hitcounts do |t|
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
