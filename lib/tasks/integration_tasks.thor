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

  desc "m20", ""

  def m20
    Translation.where("locale = 'en' and (lower(value) like ? or lower(value) like ? or lower(value) like ?)", "%buyer%", "%sales manager%", "customer").each do |t|

    if t.value.downcase.include?("category buyer")
      value = t.value.gsub(/(category buyer)/i) { |s| "#{ s.to_s[0..0] =~ /[A-Z]/ ? "Category supplier" : "category supplier" }" }
    elsif t.value.downcase.include?("sales manager")
      value = t.value.gsub(/(sales manager)/i) { |s| "#{ s.to_s[0..0] =~ /[A-Z]/ ? "Supplier" : "supplier" }" }
    elsif t.value.downcase.include?("customer")
      value = t.value.gsub(/(customer)/i) { |s| "#{ s.to_s[0..0] =~ /[A-Z]/ ? "Supplier" : "supplier" }" }
    else
      value = t.value.gsub(/(buyer)/i) { |s| "#{ s.to_s[0..0] =~ /[A-Z]/ ? "Supplier" : "supplier" }" }
    end

      t.update_attribute(:value, value)
    end

    Result.where("name like ?", "%buyer%").each do |result|
      result.update_attribute(:name, result.name.gsub(/(buyer)/i) { |s| "#{ s.to_s[0..0] =~ /[A-Z]/ ? "Supplier" : "supplier" }" })
    end

    ActiveRecord::Migration.execute("UPDATE leads SET creator_type = 'User::Member' WHERE creator_type = 'User::PurchaseManager'")
    ActiveRecord::Migration.execute("UPDATE leads SET creator_type = 'User::LeadSupplier' WHERE creator_type = 'User::LeadBuyer'")
  end
end