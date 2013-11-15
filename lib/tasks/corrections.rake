namespace :nbs do
  namespace :corrections do

    desc "Fix currencies for leads"
    task :fix_currencies_for_leads => :environment do
      puts "Processing leads.."
      leads_count = 0
      success_count = 0


      Lead.joins(:campaign => :currency).where("campaigns.currency_id != leads.currency_id").readonly(false).each do |lead|
        old_currency = lead.currency
        new_currency = lead.campaign.currency
        old_euro_price = lead.euro_price

        lead.currency = lead.campaign.currency
        lead.euro_price = new_currency.to_euro(lead.price)
        lead.recalculate_lead_purchases_euro_value = true
        lead.notify_suppliers_after_update = false # do not send email notifications

        puts "Updating lead id: ##{lead.id}, lead.price: #{lead.price}, currency_was: #{old_currency.name}##{old_currency.id}, euro_price_was: #{old_euro_price} -> currency_now: #{new_currency.name}##{new_currency.id} euro_price_now: #{lead.euro_price}"
        saved = lead.save(false)

        success_count += 1 if saved
        leads_count += 1
      end
      puts "Leads processed successfully: #{success_count} / #{leads_count}"
    end

  end
end
