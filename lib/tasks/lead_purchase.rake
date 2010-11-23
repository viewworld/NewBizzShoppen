namespace :nbs do
  desc "Update expiration statuses in leads"
  task :expiration_statuses_update => :environment do

    #TODO - Install 'whenever' gem
    #calculation details in #2599
    LeadPurchase.where(:expiration_status => LeadPurchase::ACTIVE).each do

    end

    LeadPurchase.where(:expiration_status => LeadPurchase::ABOUT_TO_EXPIRE).each do

    end

  end
end