class CreateCvotes < ActiveRecord::Migration
  def change
    create_table :cvotes do |t|
      t.integer :votecount, :default => 0
      t.integer :comment_id

      t.timestamps
    end
  end
end
