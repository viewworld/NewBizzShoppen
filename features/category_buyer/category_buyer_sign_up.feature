@m5 @category_home_pages @ao
Feature: Category buyer sign up

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
    And I fill in "user_category_buyer_address_attributes_address_line_1" with "Kaminskiego 19"
    And I fill in "user_category_buyer_address_attributes_address_line_2" with "Bielsko-Biala"
    And I fill in "user_category_buyer_address_attributes_zip_code" with "43-300"
    And I select "United Kingdom" from "user_category_buyer_address_attributes_country_id"
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
