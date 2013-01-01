namespace :cleanup do
  desc "removes stale and inactive products from the database"
  task :entries => :environment do
    # Find all the entries older than yesterday, that are not active yet
    stale_entries = Entry.where("DATE(created_at) < DATE(?)", Date.yesterday).where("status is not 'active'")

    # delete them
    stale_entries.map(&:destroy)
  end
end