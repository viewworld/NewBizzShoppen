#This is almost the same as in Agent scope
@start_pages @m2
Feature: Start page for buyer

Background: I am a guest and I am on the home page
  Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
  And User jon@lajoie.ca with role supplier is big buyer
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret

@m5 @ao @_done
Scenario: I can see latest leads in my categories (interests)
  When lead VisibleLead exists within category Computers
  And lead InvisibleLead exists within category Cars
  And user "jon@lajoie.ca" with role "supplier" has interest in following categories "Computers"
  And I follow translated "layout.main_menu.shared.home"
  Then I should see "VisibleLead" within "#latest_leads"
  And I should not see "InvisibleLead" within "#latest_leads"

# including hidden descriptions
@m5 @ao @_done
Scenario: I can see my leads
  When a lead MyLead exists within category Computers and is bought by user jon@lajoie.ca with role supplier
  And I follow translated "layout.main_menu.shared.home"
  Then I should see "MyLead" within "#my_leads"
  And I should see translated "lead_purchases.listing.hidden_description_label"
  And I should see translated "lead_purchases.listing.description_label"

@m5 @ao @_done
Scenario: I can add team members with team members enabled
  When user "jon@lajoie.ca" has team buyers enabled
  And I follow translated "layout.main_menu.shared.home"
  Then I should see translated "supplier_home.show.view.add_team_member"
  When I follow translated "supplier_home.show.view.add_team_member"
  Then I should be on suppliers new subaccount

@added @m5 @ao @_done
Scenario: I can't add team members with team members disabled
  And I follow translated "layout.main_menu.shared.home"
  Then I should not see translated "supplier_home.show.view.add_team_member"

@m5 @ao @_done
Scenario: I can sign out
  When I follow translated "layout.main_menu.shared.home"
  And I follow translated "supplier_home.show.view.sign_out"
  Then I should see translated "devise.sessions.signed_out"