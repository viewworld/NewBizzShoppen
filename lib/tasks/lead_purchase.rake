namespace :nbs do
  desc "Update expiration statuses in leads"
  task :expiration_statuses_update => :environment do

    #TODO - Install 'whenever' gem
    #calculation details in #2599
    LeadPurchase.accessible.about_to_expire.each do |lp|
      lp.about_to_expire!
    end

    LeadPurchase.accessible.expired.each do |lp|
      lp.expire!
    end

  end
end