class MoveKaramaPointsToUser < ActiveRecord::Migration
  def up
    remove_column :karma_points, :karma_points_count
    add_column :users, :karma_points_count, :integer
  end

  def down
  end
end
