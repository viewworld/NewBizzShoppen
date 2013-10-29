namespace :nbs do
  namespace :corrections do

    desc "Fix currencies for leads"
    task :fix_currencies_for_leads => :environment do
      puts "Processing leads.."
      leads_count = 0
      success_count = 0

      Lead.joins(:campaign => :currency).where("campaigns.currency_id != leads.currency_id").readonly(false).each do |lead|
        lead.currency = lead.campaign.currency
        lead.euro_price = lead.currency.to_euro(lead.price)
        saved = lead.save(false)

        success_count += 1 if saved 

        leads_count += 1
      end
      puts "Leads processed successfully: #{success_count} / #{leads_count}"
    end

  end
end


