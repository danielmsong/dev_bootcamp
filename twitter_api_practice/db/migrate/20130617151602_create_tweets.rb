class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet
      t.belongs_to :user
      t.datetime :published_at
    end
  end
end
