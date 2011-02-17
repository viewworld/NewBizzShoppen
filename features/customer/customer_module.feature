@m1 @$_customer @customer
Feature: Customer module

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role customer
  Then I sign in as bob@person.com with password supersecret

@_tested
Scenario: I create account through signup
  Given I am not sign in
  Then I follow translated "home.show.view.buyer_signup"
  And I fill in "user_customer_first_name" with "Bob"
  And I fill in "user_customer_last_name" with "Geldof"
  And I fill in "user_customer_phone" with "244224242424"
  And I fill in "user_customer_email" with "bob1@person.com"
  And I fill in "user_customer_screen_name" with "Bob Geldof"
  And I fill in "user_customer_password" with "secret"
  And I fill in "user_customer_password_confirmation" with "secret"
  And I fill in "user_customer_street" with "Street 333"
  And I fill in "user_customer_city" with "London"
  And I fill in "user_customer_zip_code" with "390333"
  And I fill in "user_customer_county" with "Geldow"
  And I select "Denmark" from "user_customer_country"
  And I check "user_customer_agreement_read"
  Then I press translated "buyer_accounts.new.view.button_create_account"

Scenario: I can follow "What do you want to do today?" links and they take me to appropriate places

@_tested_in_rspec
Scenario: After signup I am assigned roles of Customer, Lead Buyer and Lead user

@m0 @tested
Scenario: I can see my unique RSS feed URL
  Then I should see translated "customer.interests.edit.view.rss_feed_url"

@_tested
Scenario: I can select if I want to be notified about new leads matching my interests criteria
  Then I check "user_notify_about_new_leads"

@_tested
Scenario: I can select multiple lead categories that I am interested in
  Given I check "category_1"
  And I check "category_2"
  And I press translated "customer.interests.edit.view.button_update"
  Then I should see translated "customer.interests.update.flash.interests_update_successful"

@_tested
Scenario: I can select lead purchase value range that I am interested in
  Given I select "3000" from "user_deal_value_range_start"
  And I select "6000" from "user_deal_value_range_end"
  And I press translated "customer.interests.edit.view.button_update"
  Then I should see translated "customer.interests.update.flash.interests_update_successful"

@_tested @noguess
Scenario: I can select multiple lead areas/countries that I am interested in
  Given I select "Denmark" from "countries"
  Given I select "United Kingdom" from "countries"
  And I press translated "customer.interests.edit.view.button_update"
  Then I should see translated "customer.interests.update.flash.interests_update_successful"

@m5 @tgn @_tested
Scenario: I can select "all" as a Deal value
  And I check "user_all_deal_values_enabled"
  And I press translated "customer.interests.edit.view.button_update"
  Then I should see translated "customer.interests.update.flash.interests_update_successful"

@m5 @unique_categories @added @_tested
Scenario: I should not see unique categories I'm not assigned to on my interests page
  Given Category Computers is created
  And category "Computers" is unique for user with email "bob@person.com" role "customer"
  And I go to customer interests
  And I should see "Electronics"
  And I should see "Business"
  And I should see "Leisure"
  And I should see "Computers"

@m5 @unique_categories @added @_tested
Scenario: I should not see categories on my interests page when I'm assigned to unique category
  Given I have user with email other_buyer34525biz@nbs.com and role customer
  And Category OthersBuyerCategory is created
  And category "OthersBuyerCategory" is unique for user with email "other_buyer34525biz@nbs.com" role "customer"
  Given Category Computers is created
  And category "Computers" is unique for user with email "bob@person.com" role "customer"
  And I go to customer interests
  And I should see "Electronics"
  And I should see "Business"
  And I should see "Leisure"
  And I should see "Computers"
  And I should not see "OthersBuyerCategory"

@m5 @unique_categories @added @_tested
Scenario: I should have my interests fixed to the unique category I'm assigned to
  Given there are no categories
  Given Category Computers is created
  And category "Computers" is unique for user with email "bob@person.com" role "customer"
  And I go to customer interests
  Then checkbox named "category_" should be checked

@added
Scenario: If customer is category buyer he/she can see also unique categories
