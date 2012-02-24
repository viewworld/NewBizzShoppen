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

    Settings.where(:var => "email_verification_for_sales_managers").first.update_attribute(:var, "email_verification_for_suppliers") rescue nil
    Settings.where(:var => "email_verification_for_procurement_managers").first.update_attribute(:var, "email_verification_for_members") rescue nil
    Settings.where(:var => "big_buyer_purchase_limit").first.update_attribute(:var, "big_supplier_purchase_limit") rescue nil

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
                      "%buyer%", "%sales_manager%", "%customer%", "%purchase_manager%", "%procurement%").each do |t|
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
    ActiveRecord::Migration.execute("UPDATE articles SET type = 'Article::News::Supplier' WHERE type = 'Article::News::SalesManager'")
    ActiveRecord::Migration.execute("UPDATE articles SET type = 'Article::News::Member' WHERE type = 'Article::News::PurchaseManager'")

    dictionary_blurbs = {"blurb_buyer_contact_us" => "blurb_supplier_contact_us", "blurb_buyer_home" => "blurb_supplier_home",
                         "blurb_buyer_home_logged_in" => "blurb_supplier_home_logged_in", "blurb_purchase_manager_home" => "blurb_member_home",
                         "blurb_purchase_manager_home_logged_in" => "blurb_member_home_logged_in",
                          "blurb_certification_purchase_manager_signup" => "blurb_certification_member_signup"}
    dictionary_blurbs.each_pair do |old_val, new_val|
      ActiveRecord::Migration.execute("UPDATE articles SET key = '#{new_val}' WHERE key = '#{old_val}'")
    end

    [:en, :da].each do |locale|
      ::I18n.locale = locale
      EmailTemplate.where(:uniq_id => "upgrade_contact_to_category_buyer").each do |et|
        et.body = et.body.gsub("category_buyer_category_home_url", "category_supplier_category_home_url")
        et.save
      end

      EmailTemplate.where(:uniq_id => "upgraded_contact_to_category_buyer_welcome").each do |et|
        et.body = et.body.gsub("category_buyer_category_home_url", "category_supplier_category_home_url")
        et.save
      end
    end
  end

  desc "m21", ""
  def m21
    puts "Updating translations"
    Translation.where(:key => "administration.upcoming_invoices.index.view.not_invoiced_count", :locale => "en").first.update_attribute(:value, "Items")

    users = User.with_role(:deal_maker)
    users.each do |u|
      if u.has_role?(:supplier)
        u.with_role.update_attribute(:deal_maker_role_enabled, false)
      end
    end
  end

  desc "m22", ""
  def m22
    puts "Updating translations"
    Translation.where(:key => "administration.invoices.mailing.new.view.invoice_already_sent_or_paid", :locale => "en").first.update_attribute(:value, "Warning: invoice has been already %{status}.")
  end

  desc "m23", ""
  def m23
    puts "Bounces integrations"

    EmailBounce.all.each do |eb|
      ArchivedEmail.create(:status => ArchivedEmail::BOUNCED, :to => eb.email, :bounced_at => eb.bounced_at, :subject => eb.subject)
    end
  end

  desc "m24", ""
  def m24
    Translation.where(:key => "formtastic.labels.subscription_plan.billing_period", :locale => "en").first.update_attribute(:value, "Billing date (+/- weeks)")

    ActiveRecord::Migration.execute "UPDATE payment_notifications SET type = 'CartPaymentNotification' WHERE type IS NULL"
  end

  desc "m26", ""
  def m26
    Subscription.where(:vat_rate => nil).each { |s| s.update_attribute(:vat_rate, s.seller.vat_rate) }
    SubscriptionPlanLine.where("resource_type = 'Subscription' OR resource_type = 'SubscriptionSubPeriod'").each do |spl|
      spl.brutto_price = spl.vat_rate > 0 ? spl.price + (spl.price * BigDecimal(spl.vat_rate.to_s).div(100,4)) : spl.price
      spl.save
    end
  end

  desc "m26b", ""
  def m26b
    Translation.where(:key => "layout.fairdeals.main_menu.member.my_requests", :locale => "en").first.update_attribute(:value, "My deals")
    Translation.where(:key => "formtastic.labels.subscription_plan.big_buyer", :locale => "en").first.update_attribute(:value, "Got credit enabled?")
    Translation.where(:key => "supplier_home.show.view.create_new_supplier_account", :locale => "en").first.update_attribute(:value, "Create new category supplier account")
    Translation.where(:key => "supplier_accounts.new.view.title", :locale => "en").first.update_attribute(:value, "Category supplier signup")
    Translation.where(:key => "deal_maker_users.index.view.new_supplier", :locale => "en").first.update_attribute(:value, "New category supplier")
    Translation.where(:key => "deal_maker_users.index.view.user_supplier", :locale => "en").first.update_attribute(:value, "Category supplier")
    Translation.where(:key => "formtastic.labels.user/category_supplier.show_deals", :locale => "en").first.update_attribute(:value, "Show all deals")

    [:da, :en].each do |locale|
      ::I18n.locale = locale
      email_template = EmailTemplate.where(:uniq_id => "deal_certification_request").first
      email_template.update_attribute(:body, email_template.body.gsub("new_sales_manager_account_url", "login_url"))
    end

    User::Supplier.all.each do |user|
      user = user.with_role
      user.auto_buy_enabled = true if user.has_role?(:category_supplier)
      user.save
    end
  end

  desc "m27", ""
  def m27
    LeadCategory.all.each do |category|
      [:refresh_leads_count_cache!, :refresh_published_leads_count_cache!].each do |method|
        category.send(method)
      end
    end
  end

  desc "m27b", ""
  def m27b
    Translation.where(:key => "formtastic.labels.lead.company_name", :locale => "en").first.update_attribute(:value, "Company name")
    Translation.where(:key => "formtastic.labels.lead.company_name", :locale => "da").first.update_attribute(:value, "Firmanavn")
  end

  desc "m28", ""
  def m28
    Campaign.where(:cost_type => [1,2]).each { |c| c.apply_billing_rate_to_user_session_logs! }
  end

  desc "m29", ""
  def m29
#    Campaign.all.each do |campaign|
#      puts "Campaign: #{campaign.name}"
#      campaign.campaigns_results.each do |campaigns_result|
#        if campaigns_result.value.to_i > 0
#          campaigns_result.euro_value = campaigns_result.value
#          campaigns_result.value = campaign.currency.from_euro(campaigns_result.value).to_f
#          campaigns_result.save
#        end
#      end
#    end
  end

  desc "m29b", ""
  def m29b
    Translation.where(:key => "campaign_reports.index.table.value_created", :locale => "en").first.update_attribute(:value, "Value (EUR)")
    Translation.where(:key => "campaign_reports.index.table.production_cost", :locale => "en").first.update_attribute(:value, "Cost (EUR)")
    Translation.where(:key => "campaign_reports.index.table.campaign_results", :locale => "en").first.update_attribute(:value, "Results")
    Translation.where(:key => "campaign_reports.index.table.predicted_results", :locale => "en").first.update_attribute(:value, "Prediction")
  end
end