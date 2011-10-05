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
    #setup

    Settings.where(:var => "email_verification_for_procurement_managers").first.update_attribute(:var, "email_verification_for_members")
    Settings.where(:var => "big_buyer_purchase_limit").first.update_attribute(:var, "big_supplier_purchase_limit")

    dictionary = {"category buyer" => "category supplier", "sales manager" => "supplier", "customer" => "supplier", "buyer" => "supplier", "procurement manager" => "member", "procurement" => "member"}
    dictionary_keys = {"category_buyer" => "category_supplier", "sales_manager" => "supplier", "customer" => "supplier", "buyer" => "supplier", "purchase_manager" => "member", "procurement" => "member", "member_manager" => "member"}
    dictionary_klasses = { "User::PurchaseManager" => "User::Member", "User::LeadBuyer" => "User::LeadSupplier", "User::CategoryBuyer" => "User::CategorySupplier",
                           "User::Customer" => "User::Supplier"}

    puts "Translations values..."
    Translation.where("locale = 'en' and (lower(value) like ? or lower(value) like ? or lower(value) like ? or lower(value) like ? or lower(value) like ?)",
                      "%buyer%", "%sales manager%", "%customer%", "%procurement manager%", "%procurement%").each do |t|
      dictionary.each_pair do |old_val, new_val|
        if t.value.downcase.include?(old_val)
          t.value = StringUtils.replace(t.value, old_val, new_val)
        end
      end

      t.save
    end

    puts "Translations keys..."
    Translation.where("(lower(key) like ? or lower(key) like ? or lower(key) like ? or lower(key) like ? or lower(key) like ?)",
                      "%buyer%", "%sales manager%", "%customer%", "%purchase_manager%", "%procurement%").each do |t|
      dictionary_keys.each_pair do |old_val, new_val|
        if t.key.downcase.include?(old_val)
          t.key = t.key.gsub(old_val, new_val)
        end
      end

      t.save
    end

    puts "Results..."
    Result.where("lower(name) like ?", "%buyer%").each do |result|
      result.update_attribute(:name, StringUtils.replace(result.name, "buyer", "supplier"))
    end

    dictionary_klasses.each_pair do |old_val, new_val|
      ActiveRecord::Migration.execute("UPDATE leads SET creator_type = '#{new_val}' WHERE creator_type = '#{old_val}'")
      ActiveRecord::Migration.execute("UPDATE addresses SET addressable_type = '#{new_val}' WHERE addressable_type = '#{old_val}'")
      ActiveRecord::Migration.execute("UPDATE lead_templates SET creator_type = '#{new_val}' WHERE creator_type = '#{old_val}'")
    end
    ActiveRecord::Migration.execute("UPDATE addresses SET type = 'Address::InvoiceSupplier' WHERE type = 'Address::InvoiceCustomer'")
  end
end