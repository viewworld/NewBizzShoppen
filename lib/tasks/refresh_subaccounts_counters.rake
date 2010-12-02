namespace :nbs do
  desc "Refresh subaccounts counters"
  task :refresh_subaccounts_counters => :environment do
    User::Abstract.where("parent_id is not null").each do |user|
      user.refresh_subaccounts_counters!
    end
  end
end