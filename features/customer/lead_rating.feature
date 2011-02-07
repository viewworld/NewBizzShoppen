@m3 @$_customer @tgn @lead_rating
Feature: Lead Rating

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role customer
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer bob@person.com
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal is bought by user bob@person.com with role customer and is assigned to user lead_user2@person.com with role lead_user
  Then I sign in as bob@person.com with password supersecret
  And I go to buyer lead purchases

@_tested @selenium
Scenario: I can rate a lead
  Given I select translated "activerecord.attributes.lead_purchase.rating_levels.rating_level1" from "rating_level"
  And I go to buyer lead purchases
  Then "rating_level" should be selected for value translated "activerecord.attributes.lead_purchase.rating_levels.rating_level1"

@_tested @selenium
Scenario: I can bulk rate a lead
  Given lead Monitors ultimate deal exists within category Computers
  And lead Monitors ultimate deal is bought by user bob@person.com with role customer and is assigned to user lead_user2@person.com with role lead_user
  Given I check "mark_all"
  And I select translated "activerecord.attributes.lead_purchase.rating_levels.rating_level1" from "bulk_rating_level"
  And I follow translated "lead_buyer.lead_purchases.index.view.bulk_update_button"
  Then I should see translated "buyer.bulk_lead_purchase_update.create.flash.lead_purchases_updated_successfully"

@_tested @selenium
Scenario: I can select from 4 different rating levels: Very good, good, satisfactory, unsatisfactory
  Given I select translated "activerecord.attributes.lead_purchase.rating_levels.rating_level2" from "rating_level"
  And I go to buyer lead purchases
  Then "rating_level" should be selected for value translated "activerecord.attributes.lead_purchase.rating_levels.rating_level2"

# "Incorrect or missing contact information It has been impossible to get in contact with the lead ----- why?"
# "The information provided in the lead description dos not match the information that the contact person supplied when i contacted him. --- in what way did i differ?"
# "The lead has already chosen another suppler"
# "Other reason that the lead was unsatisfactory (enter text)"
@_tested @selenium
Scenario: I can select a reason when I rate lead as 'unsatisfactory'
  Given I select translated "activerecord.attributes.lead_purchase.rating_levels.rating_level12" from "rating_level"
  Then I fill in "rating_reason" with "The reason for unsatisfactory rating"
  And I press translated "lead_buyer.lead_purchases.index.view.update_rating_button"
  And I go to buyer lead purchases
  Then "rating_level" should be selected for value translated "activerecord.attributes.lead_purchase.rating_levels.rating_level12"

@_tested @selenium
Scenario: I must enter additional explaination for selected reason
  Given I select translated "activerecord.attributes.lead_purchase.rating_levels.rating_level12" from "rating_level"
  Then I fill in "rating_reason" with "The reason for unsatisfactory rating"
  And I press translated "lead_buyer.lead_purchases.index.view.update_rating_button"
  And I go to buyer lead purchases
  Then "rating_level" should be selected for value translated "activerecord.attributes.lead_purchase.rating_levels.rating_level12"

# When a lead is rated as unsatisfactory, the agent should be alerted but he must not be able to reply.
# Only the admin must be able to reply on the complaint.
@_tested
Scenario: Agent is informed when his lead is rated as 'unsatisfactory'
  And I have user with email agent@person.com and role agent
  Given lead Ultimate mouses deal is created by user agent@person.com with role agent
  And a lead Ultimate mouses deal exists within category Computers and is bought by user bob@person.com with role customer
  And a lead "Ultimate mouses deal" has bad rating
  Then last email sent should have been sent to recipient "agent@person.com"
  And last email sent should have content "has been rated as"

# should this listing include all ratings or only unsatisfactory?
@_tested
Scenario: As agent I can view 'unsatisfactory' ratings regarding my leads
  Given I am not sign in
  Given I am on the homepage
  And I am signed up and confirmed as user with email agent@person.com and password supersecret and role agent
  Given lead Ultimate monitors deal is created by user agent@person.com with role agent
  And a lead Ultimate monitors deal exists within category Computers and is bought by user bob@person.com with role customer
  And a lead "Ultimate monitors deal" has good rating
  Given lead Ultimate mouses deal is created by user agent@person.com with role agent
  And a lead Ultimate mouses deal exists within category Computers and is bought by user bob@person.com with role customer
  And a lead "Ultimate mouses deal" has bad rating
  Then I sign in as agent@person.com with password supersecret
  And I go to agents leads
  Then I follow translated "leads.table.unsatisfactory_rating"
  Then I follow translated "leads.table.unsatisfactory_rating"
  Then I should have translated value "leads.listing.has_unsatisfactory_rating_yes" in the css path "tr:nth-child(1) td:nth-child(13)"
  Given I follow translated "leads.listing.has_unsatisfactory_rating_yes"
  Then I should see translated "agent.leads.edit.view.rating_reason"


# should this listing include all ratings or only unsatisfactory?
@_tested
Scenario: As admin I can view all 'unsatisfactory' ratings
  Given I am not sign in
  Given I am on the homepage
  And I am signed up and confirmed as user with email admin@person.com and password supersecret and role admin
  And I have user with email agent@person.com and role agent
  Given lead Ultimate mouses deal is created by user agent@person.com with role agent
  And a lead Ultimate mouses deal exists within category Computers and is bought by user bob@person.com with role customer
  And a lead "Ultimate mouses deal" has bad rating
  Then I sign in as admin@person.com with password supersecret
  And I go to administration leads
  When I follow translated "leads.table.unsatisfactory_rating"
  And I follow translated "leads.table.unsatisfactory_rating"
  Then I should have translated value "leads.listing.has_unsatisfactory_rating_yes" in the css path "tr:nth-child(1) td:nth-child(13)"
  Given I follow translated "leads.listing.has_unsatisfactory_rating_yes"
  Then I should see translated "administration.leads.show.view.rating_reason"

# email or internal messages?
@m5 @tgn
Scenario: As admin I can reply to 'unsatisfactory' rating