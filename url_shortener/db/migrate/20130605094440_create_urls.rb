class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.string :shortened_url
      t.integer :click_counter, :default => 0
      t.timestamps
      t.integer :user_id
    end
  end
end

