class IntegrationTasks < Thor
  require File.expand_path('config/environment.rb')

  desc "m15", ""

  def m15
    puts " :: integration: m15 tasks... :: "

    puts "Fill in UserSessionLog#campaign_id with campaign"

    (User::Agent.all + User::CallCentreAgent.all).select { |u| u.campaigns.count > 0 }.each do |user|
      UserSessionLog.where(:user_id => user.id, :log_type => UserSessionLog::TYPE_CAMPAIGN).each { |usl| usl.update_attribute(:campaign_id, user.campaigns.first.id) }
    end

    #Set hours count
    UserSessionLog.all.each { |usl| usl.save }

    puts "Fill in Contacts#lead_id with upgraded lead"

    Contact.where("call_results.result_id = ? and lead_id is NULL", Result.find_by_name("Upgraded to lead").id).joins(:call_results).readonly(false).each do |contact|
      contact.update_attribute(:lead, Lead.where("header like ?", contact.header).first)
    end


    puts "Euro price => round(2)"

    LeadPurchase.where("euro_price IS NULL").each { |lp| lp.update_attribute(:euro_price, lp.lead.currency.to_euro(lp.lead.price)) }

    LeadPurchase.all.each { |lp| lp.update_attribute(:euro_price, lp.euro_price.round(2))  }


    puts "Euro price => set euro_price for leads upgraded from contacts"

    Contact.where("lead_id IS NOT NULL").each do |contact|
      lead = contact.lead
      if lead.lead_purchases.any?
        lead.update_attributes(:notify_buyers_after_update => false, :euro_price => lead.lead_purchases.first.euro_price)
      else
        lead.update_attributes(:notify_buyers_after_update => false, :euro_price => lead.currency.to_euro(lead.price))
      end
    end
  end
end