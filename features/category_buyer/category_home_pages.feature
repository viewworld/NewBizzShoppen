@added @m5 @ao @category_home_pages
Feature: Category home pages

  @_done
  Scenario: I should see a list of category home pages on main home page
    When Category named "Best Leads" already exists
    And I am on the home page
    Then I should see "Best Leads"

  @_done
  Scenario: I can go to category home page from main home page
    When Category named "Best Leads" already exists
    And I am on the home page
    And I follow "Best Leads"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can access category home page with direct link /category_name
    When Category named "Best Leads" already exists
    And I visit URL "/best-leads"
    Then I should be on category home page for Best Leads
    And I should see translated "category_home.show.view.header_welcome"

  @_done
  Scenario: I should be redirected to home page when I try to access non-existant category home page
    When I visit URL "/best-leads"
    Then I should be on the home page

  @_done
  Scenario: I can create new Category Buyer account from category home page
    When Category named "Best Leads" already exists
    And I am on category home page for Best Leads
    And I follow translated "category_home.show.view.category_buyer_signup"
    Then I should see translated "category_buyer_accounts.new.view.title"
    When I fill in "user_category_buyer_first_name" with "Jon"
    And I fill in "user_category_buyer_last_name" with "Lajoie"
    And I fill in "user_category_buyer_phone" with "123123123"
    And I fill in "user_category_buyer_email" with "cb@nbs.fake"
    And I fill in "user_category_buyer_screen_name" with "Normal Guy"
    And I fill in "user_category_buyer_password" with "secret"
    And I fill in "user_category_buyer_password_confirmation" with "secret"
    And I fill in "user_category_buyer_street" with "Kaminskiego 19"
    And I fill in "user_category_buyer_city" with "Bielsko-Biala"
    And I fill in "user_category_buyer_zip_code" with "43-300"
    And I select "United Kingdom" from "user_category_buyer_country"
    And I check "user_category_buyer_agreement_read"
    And I press translated "category_buyer_accounts.new.view.button_create_account"
    Then I should see translated "flash.category_buyer_accounts.actions.create.notice"

  @_done
  Scenario: Account created from category home page has interests fixed to this category
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should be on customer interests
    And I should not see translated "customer.interests.edit.view.categories"

  @_done
  Scenario: Interests other than category should be visible to account registered from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should be on customer interests
    And I should see translated "customer.interests.edit.view.deal_values"
    And I should see translated "customer.interests.edit.view.countries"

  @_done
  Scenario: I can't access category home pages other than the one I registered from
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I visit URL "/worst-leads"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can't see categories other than the one I registered from
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I visit URL "/categories"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can see a list of news on category home page
    When Category named "Best Leads" already exists
    And there is a published news for category "Best Leads"
    And I am on category home page for Best Leads
    Then I should see "1" items on a list within "#news"

  @_done
  Scenario: I can see only news created for specific category
    When Category named "Best Leads" already exists
    And there is a published news for category "Best Leads"
    And I am on category home page for Best Leads
    Then I should see "1" items on a list within "#news"
    When Category named "Worst Leads" already exists
    And there is a published news for category "Worst Leads"
    And I am on category home page for Worst Leads
    Then I should see "1" items on a list within "#news"

  @_done
  Scenario: As administrator I can see all news for categories
    When Category named "Best Leads" already exists
    And there is a published news for category "Best Leads"
    And Category named "Worst Leads" already exists
    And there is a published news for category "Worst Leads"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.news"
    And I select translated "administration.news.index.view.category_homes" from "search_with_subclass"
    And I press translated "administration.news.index.view.search_button"
    Then I should see "2" rows in a table within "#news_table"

  @selenium @_done
  Scenario: As administrator I can update and change category for category news
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And there is a published news for category "Best Leads"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.news"
    And I select translated "administration.news.index.view.category_homes" from "search_with_subclass"
    And I press translated "administration.news.index.view.search_button"
    And I click hidden link by url regex "/administration\/news\/\d+\/edit/"
    And I fill in "news_title" with "NewsForWorstLeads"
    And I select "Worst Leads" from "news_resource_id"
    And I press translated "administration.news.edit.view.button_save"
    And I am on category home page for Worst Leads
    Then I should see "1" items on a list within "#news"
    And I should see "NewsForWorstLeads"

  @selenium @_done
  Scenario: As administrator I can create news for category
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.news"
    And I select translated "administration.news.index.view.category_homes" from "subclass"
    And I follow translated "administration.news.index.view.new_news"
    And I fill in "news_title" with "NewsForBestLeads"
    And I select "Best Leads" from "news_resource_id"
    And I fill in "news_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    And I check "news_published"
    And I press translated "administration.news.edit.view.button_save"
    And I am on category home page for Best Leads
    Then I should see "1" items on a list within "#news"
    And I should see "NewsForBestLeads"

  @_done
  Scenario: I can see a list of most recent category leads on category home page
    When Category named "Best Leads" already exists
    And lead LeadOne exists within category Best Leads
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    Then I should see "1" items on a list within "#latest_leads"
    And I should see "LeadOne" within "#latest_leads"

  @_done
  Scenario: I can't see leads from other categories on recent leads
    When Category named "Best Leads" already exists
    And lead BestLead exists within category Best Leads
    And Category named "Worst Leads" already exists
    And lead WorstLead exists within category Worst Leads
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    Then I should see "1" items on a list within "#latest_leads"
    And I should see "BestLead" within "#latest_leads"
    And I should not see "WorstLead" within "#latest_leads"

  @_done
  Scenario: I can see complete list of category leads
    When Category named "Best Leads" already exists
    And there are "11" leads in category "Best Leads"
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    Then I should see "10" items on a list within "#latest_leads"
    When I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    And I follow "3" within ".pagination"
    Then I should see "1" rows in a table within ".leads_table tbody"

  @_done
  Scenario: I can buy selected leads from this category
    When Category named "Best Leads" already exists
    And there are "11" leads in category "Best Leads"
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    And I follow translated "leads.index.add_to_cart_link"
    Then I should see translated "buyer.cart_items.create.flash.cart_item_creation_successful"

  @_done
  Scenario: I can see registration panel on category home page when I'm a guest
    When Category named "Best Leads" already exists
    And I am on category home page for Best Leads
    Then I should see translated "category_home.show.view.category_buyer_signup"

  @_done
  Scenario: I can see log in panel on category home page when I'm a guest
    When Category named "Best Leads" already exists
    And I am on category home page for Best Leads
    Then I should see translated "activerecord.attributes.user.email"
    And I should see translated "activerecord.attributes.user.password"

  @_done
  Scenario: I can sign in from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on category home page for Best Leads
    And I fill in "user_email" with "jon@lajoie.ca"
    And I fill in "user_password" with "secret"
    And I press translated "category_home.show.view.sign_in"
    Then I should see translated "devise.sessions.signed_in"

  @_done
  Scenario: I should be redirected back to category home page after successful sign up
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on category home page for Best Leads
    And I fill in "user_email" with "jon@lajoie.ca"
    And I fill in "user_password" with "secret"
    And I press translated "category_home.show.view.sign_in"
    And I sign out
    And I am on category home page for Best Leads
    And I fill in "user_email" with "jon@lajoie.ca"
    And I fill in "user_password" with "secret"
    And I press translated "category_home.show.view.sign_in"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can add lead users when registered from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.customer.subaccounts"
    Then I follow translated "customer.subaccounts.index.view.new_lead_user"
    And I fill in "user_lead_user_first_name" with "Mark"
    And I fill in "user_lead_user_last_name" with "Driscoll"
    And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_user_screen_name" with "ML Driscoll"
    And I fill in "user_lead_user_password" with "secret"
    And I fill in "user_lead_user_password_confirmation" with "secret"
    And I press translated "customer.subaccounts.new.view.button_create"
    Then I should see translated "customer.subaccounts.create.flash.subaccount_creation_successful"
    And user "driscoll@person.noserver.com" should have role "category_buyer"

  @_done
  Scenario: I can add lead buyers when registered from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.customer.subaccounts"
    Then I follow translated "customer.subaccounts.index.view.new_lead_buyer"
    And I fill in "user_lead_buyer_first_name" with "Mark"
    And I fill in "user_lead_buyer_last_name" with "Driscoll"
    And I fill in "user_lead_buyer_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_buyer_screen_name" with "ML Driscoll"
    And I fill in "user_lead_buyer_password" with "secret"
    And I fill in "user_lead_buyer_password_confirmation" with "secret"
    And I press translated "customer.subaccounts.new.view.button_create"
    Then I should see translated "customer.subaccounts.create.flash.subaccount_creation_successful"
    And user "driscoll@person.noserver.com" should have role "category_buyer"

  @_done
  Scenario: Subaccounts should have access only to parents category
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.customer.subaccounts"
    Then I follow translated "customer.subaccounts.index.view.new_lead_buyer"
    And I fill in "user_lead_buyer_first_name" with "Mark"
    And I fill in "user_lead_buyer_last_name" with "Driscoll"
    And I fill in "user_lead_buyer_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_buyer_screen_name" with "ML Driscoll"
    And I fill in "user_lead_buyer_password" with "secret"
    And I fill in "user_lead_buyer_password_confirmation" with "secret"
    And I press translated "customer.subaccounts.new.view.button_create"
    And I sign out
    And user "driscoll@person.noserver.com" is confirmed
    And I sign in as driscoll@person.noserver.com with password secret
    Then I should be on category home page for Best Leads
    When I follow translated "layout.main_menu.shared.browse_leads"
    Then I should be on category home leads page for Best Leads
    When I visit URL "/categories"
    Then I should be on category home page for Best Leads
    When I visit URL "/leads"
    Then I should be on category home page for Best Leads
    When I follow translated "layout.main_menu.shared.home"
    Then I should be on category home page for Best Leads

