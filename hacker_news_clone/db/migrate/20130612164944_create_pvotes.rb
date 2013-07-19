class CreatePvotes < ActiveRecord::Migration
  def change
    create_table :pvotes do |t|
      t.integer :votecount, :default => 0 
      t.integer :post_id

      t.timestamps
    end
  end
end
