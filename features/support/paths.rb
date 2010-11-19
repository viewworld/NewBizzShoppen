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
    when /agents leads/
        '/agents/leads'
    when /browse leads/
        '/categories'
    when /lead_buyer cart items/
        '/buyers/cart_items'
    when /lead_buyer interests/
        '/buyers/interests/edit'
    when /lead user lead purchases/
        '/lead_users/lead_purchases'
    when /customers subaccounts/
        '/customers/subaccounts'
    when /customers lead requests/
        '/customers/lead_requests'
    when /lead_buyer lead purchases/
        '/buyers/lead_purchases'
    when /my profile/
        '/my_profile'
    when /agent sign up/
        '/agent_accounts/new'
    when /lead_buyer sign up/
        '/buyer_accounts/new'
    when /sample image/
        "#{::Rails.root.to_s}/spec/fixtures/sample.jpg"
    when /resend confirmation instructions/
        '/users/confirmation/new'
    when /reset password/
        '/users/password/new'
    when /lead user lead requests/
        '/lead_users/lead_requests'


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
