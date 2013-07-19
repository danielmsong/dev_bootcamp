class ChangeCountToZero < ActiveRecord::Migration
  def change
    change_column :users, :karma_points_count, :integer, :default => 0
  end
end
