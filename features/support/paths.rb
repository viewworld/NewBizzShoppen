module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /the home\s?page/
        '/'
      when /the agent home page/
        '/agent_home'
      when /the supplier home page/
        '/supplier_home'
      when /the member home page/
        '/member_home'
      when /contact us/
        '/contact_us'
      when /administration root/
        '/administration'
      when /agents root/
        '/agents'
      when /suppliers root/
        '/suppliers'
      when /administration users/
        '/administration/users'
      when /administration edit user for (.*)/
        edit_administration_user_path(User.where(:email => $1).first)
      when /administration categories/
        '/administration/categories'
      when /administration edit category (.*)/
        edit_administration_category_path(Category.where(:name => $1).first)
      when /administration email templates/
        '/administration/email_templates'
      when /administration settings/
        '/administration/setting/edit'
      when /administration leads/
        '/administration/leads'
      when /administration transactions/
        '/administration/invoicing/payment_transactions'
      when /administration creditors/
        '/administration/invoicing/creditors'
      when /administration invoices/
        '/administration/invoicing/invoices'
      when /administration upcoming invoices/
        '/administration/invoicing/upcoming_invoices'
      when /administration countries/
        '/administration/countries'
      when /administration sellers/
        administration_sellers_path
      when /administration hints/
        administration_hints_path
      when /administration new category supplier/
        new_administration_user_path(:role => :category_supplier)
      when /category home leads page for (.*)/
        "/#{$1.to_url}/leads"
      when /category home page for (.*)/
        "/#{$1.to_url}"
      when /category leads page for (.*)/
        "/#{$1.to_url}/leads"
      when /agents leads/
        '/agents/leads'
      when /agents lead templates/
        '/agents/lead_templates'
      when /browse leads/
        '/categories'
      when /browse deals/
        '/deal_categories'
      when /browse (.*) deals/
        dc = DealCategory.where(:name => $1).first
        deals_index_path(:slag => dc.cached_slug)
      when /show deal (.+)/
        deal = Deal.where(:header => $1).first
        deal_path(deal)
      when /all deals/
        all_deals_path
      when /deals/
        '/deals'
      when /supplier cart/
        '/suppliers/cart'
      when /supplier cart items/
        '/suppliers/cart_items'
      when /call centre agents/
        '/call_centres/call_centre_agents'
      when /call centre agents leads/
        '/call_centre_agents/leads'
      when /call centre leads/
        '/call_centres/leads'
      when /call centre lead templates/
        '/call_centres/lead_templates'
      when /supplier interests/
        '/suppliers/interests/edit'
      when /lead user lead purchases/
        '/lead_users/lead_purchases'
      when /suppliers subaccounts/
        '/suppliers/subaccounts'
      when /suppliers new subaccount/
        '/suppliers/subaccounts/new'
      when /suppliers lead requests/
        '/suppliers/lead_requests'
      when /supplier lead purchases/
        '/suppliers/lead_purchases'
      when /my profile/
        '/my_profile'
      when /agent sign up/
        '/agent_accounts/new'
      when /supplier sign up/
        '/supplier_accounts/new'
      when /member sign up/
        '/member_accounts/new'
      when /document/
        "#{::Rails.root.to_s}/spec/fixtures/sample_document.odt"
      when /sample image/
        "#{::Rails.root.to_s}/spec/fixtures/sample.jpg"
      when /lead1badheader_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/bad_header_leads_adv_import.ods"
      when /lead2badobject_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/bad_object_leads_adv_import.ods"
      when /lead3allgood_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/leads_adv_import.ods"
      when /contact1badheader_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/bad_header_contacts_adv_import.ods"
      when /contact2badobject_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/bad_object_contacts_adv_import.ods"
      when /contact3allgood_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/contacts_adv_import.ods"
      when /user1badheader_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/bad_header_users_adv_import.ods"
      when /user2badobject_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/bad_object_users_adv_import.ods"
      when /usert3allgood_adv_import/
        "#{::Rails.root.to_s}/spec/fixtures/users_adv_import.ods"
      when /resend confirmation instructions/
        '/users/confirmation/new'
      when /reset password/
        '/users/password/new'
      when /lead user lead requests/
        '/lead_users/lead_requests'
      when /the (.*) lead/
        lead_path(Lead.find_by_header($1))
      when /members leads/
        members_leads_path
      when /members lead templates/
        members_lead_templates_path
      when /leads/
        leads_path
      when /lead edit page for (.*)/
        lead = Lead.where(:header => $1).first
        edit_lead_path(lead)
      when /agent home/
        agent_home_path
      when /supplier home/
        supplier_home_path
      when /member home/
        member_home_path
      when /administration articles page/
        administration_articles_path
      when /administration news page/
        administration_news_index_path
      when /administration (.*) article page/
        administration_article_path(Article::Cms.includes(:translations).where(:article_translations => {:title => $1}).first)
      when /administration (.*) news page/
        administration_news_path(Article::News.includes(:translations).where(:article_translations => {:title => $1}).first)
      when /administration edit user (.*)/
        edit_administration_user_path(User.where(:email => $1).first)
      when /administration new vat rate/
        new_administration_vat_rate_path
      when /(.*) news page/
        news = Article::News.find_by_title($1)
        news_path(news)
      when /(.*) article page/
        news = Article.find_by_title($1)
        article_path(news)
      when /administration currencies/
        administration_currencies_path
      when /administration seller (.*) edit/
        edit_administration_seller_path(Seller.where(:company_name => $1).first)
      when /administration (.*) seller/
        administration_seller_path(Seller.where(:company_name => $1).first)
      when /^the administration deal edit page for (.*)/
        deal = Deal.where(:header => $1).first
        edit_administration_deal_path(deal)
      when /^the agent deal edit page for (.*)/
        deal = Deal.where(:header => $1).first
        edit_agents_deal_path(deal)
      when /^the call_centre deal edit page for (.*)/
        deal = Deal.where(:header => $1).first
        edit_call_centres_deal_path(deal)
      when /^the call_centre_agent deal edit page for (.*)/
        deal = Deal.where(:header => $1).first
        edit_call_centre_agents_deal_path(deal)
      when /^the supplier deal edit page for (.*)/
        deal = Deal.where(:header => $1).first
        edit_suppliers_deal_path(deal)
      when /comments threads/
        comments_threads_path
      when /administration edit subscription plan named (.*)/
        edit_administration_subscription_plan_path(SubscriptionPlan.where(:name => $1).first)
      when /campaign testing one page/
        callers_campaign_agent_work_screen_index_path(Campaign.find_by_name("Testing One"))
      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))

      else
        begin
          page_name =~ /the (.*) page/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue Object => e
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)
