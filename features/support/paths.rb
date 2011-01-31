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
    when /contact us/
      '/contact_us'
    when /administration root/
      '/administration'
    when /agents root/
      '/agents'
    when /administration users/
        '/administration/users'
    when /administration categories/
        '/administration/categories'
    when /administration email templates/
        '/administration/email_templates'
    when /administration settings/
        '/administration/setting/edit'
    when /administration leads/
        '/administration/leads'
    when /administration transactions/
        '/administration/invoicing/payment_transactions'
    when /administration invoices/
        '/administration/invoicing/invoices'
    when /administration upcoming invoices/
        '/administration/invoicing/upcoming_invoices'
    when /agents leads/
        '/agents/leads'
    when /browse leads/
        '/categories'
    when /buyer cart items/
        '/buyers/cart_items'
    when /call centre agents/
        '/call_centres/call_centre_agents'
    when /customer interests/
        '/customers/interests/edit'
    when /lead user lead purchases/
        '/lead_users/lead_purchases'
    when /customers subaccounts/
        '/customers/subaccounts'
    when /customers lead requests/
        '/customers/lead_requests'
    when /buyer lead purchases/
        '/buyers/lead_purchases'
    when /my profile/
        '/my_profile'
    when /agent sign up/
        '/agent_accounts/new'
    when /buyer sign up/
        '/buyer_accounts/new'
    when /purchase manager sign up/
        '/purchase_manager_accounts/new'
    when /sample image/
        "#{::Rails.root.to_s}/spec/fixtures/sample.jpg"
    when /resend confirmation instructions/
        '/users/confirmation/new'
    when /reset password/
        '/users/password/new'
    when /lead user lead requests/
        '/lead_users/lead_requests'
    when /the (.*) lead/
        lead_path(Lead.find_by_header($1))
    when /purchase managers leads/
        purchase_managers_leads_path
    when /leads/
        leads_path
    when /agent home/
        agent_home_path
    when /buyer home/
        buyer_home_path
    when /administration articles page/
        administration_articles_path
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
      news = Article::Cms.find_by_title($1)
      article_path(news)
    when /administration currencies/
      administration_currencies_path
    when /category home page for (.*)/
      "/#{$1.to_url}"


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
