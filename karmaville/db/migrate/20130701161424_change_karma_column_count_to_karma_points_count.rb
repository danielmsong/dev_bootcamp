class ChangeKarmaColumnCountToKarmaPointsCount < ActiveRecord::Migration
  def up
    add_column :karma_points, :karma_points_count, :integer
  end

  def down
  end
end
