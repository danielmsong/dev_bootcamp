class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :email
      t.integer :category_id
      t.string :unique_url

      t.timestamps
    end
  end
end
