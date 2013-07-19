namespace :db do
  desc "populate karma count"
  task :populate => :environment do
    User.all.each do |u|
      karma_total = u.karma_points.sum(:value)
      u.update_attribute(:karma_points_count, karma_total)
    end
  end
end
