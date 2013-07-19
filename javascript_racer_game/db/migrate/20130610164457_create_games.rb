class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.float    :time
      t.string  :url
      t.timestamps
    end
  end
end
