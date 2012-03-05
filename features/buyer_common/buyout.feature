@customer @ao @buyouts @_requested
Feature: Buy out

  @m6 @_done @_tested
  Scenario: I can see buy-out links for lead if it's not bought by other buyer and category allows buyouts
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And a lead Monitors exists within category Computers and is bought by user monitor.buyer@nbs.com with role supplier
    And lead "Monitors" has attributes "sale_limit:10,price:234"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I fill in "search_with_keyword" with "Printers"
    And I press translated "leads.index.search.search_button"
    Then I should see translated "leads.index.add_to_cart_buyout_link" in the "1" row of table "table.leads_table tbody"
    And I should see translated "leads.listing.buyout_price_label" in the "1" row of table "table.leads_table tbody"
    When I fill in "search_with_keyword" with "Monitors"
    And I press translated "leads.index.search.search_button"
    Then I should not see translated "leads.index.add_to_cart_buyout_link" in the "1" row of table "table.leads_table tbody"
    And I should not see translated "leads.listing.buyout_price_label" in the "1" row of table "table.leads_table tbody"

  @added @m6 @_done @_tested
  Scenario: I can't see buy-out links for lead if category doesn't allow buyouts
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:0"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And a lead Monitors exists within category Computers and is bought by user monitor.buyer@nbs.com with role supplier
    And lead "Monitors" has attributes "sale_limit:10,price:234"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    Then I should not see translated "leads.index.add_to_cart_buyout_link" in the "2" row of table "table.leads_table tbody"
    And I should not see translated "leads.listing.buyout_price_label" in the "2" row of table "table.leads_table tbody"
    Then I should not see translated "leads.index.add_to_cart_buyout_link" in the "1" row of table "table.leads_table tbody"
    And I should not see translated "leads.listing.buyout_price_label" in the "1" row of table "table.leads_table tbody"

  @added @m6 @_done @_tested
  Scenario: I should see sale limit * price as buyout price
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    Then I should see "123.00" in the "1" row of table "table.leads_table tbody"
    And I should see "1,230.00" in the "1" row of table "table.leads_table tbody"

  @added @m6 @_done @_tested
  Scenario: I can buyout lead and see all items in cart
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    Then I should see "1,230.00" within "div.cart_content"
    And I should see "10 x" within "div.cart_content"
    And I follow translated "layout.cart.show_cart"
    Then I should see "123.00" within ".ta_c:nth-child(3)"
    And I should see "10" within ".ta_c:nth-child(5)"
    And I should see "1,230.00" within ".ta_c:nth-child(7)"
    And I should see "1,230.00" within "span.green"

  @added @m6 @_done @_tested
  Scenario: I can buyout and pay by paypal
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I follow translated "layout.cart.show_cart"
    Then I press translated "supplier.cart.show.view.checkout_link"
    Then I should be redirected to paypal page
    Then paypal payment for user with email "jon@lajoie.ca" and role "supplier"
    And lead named "Printers" is paid and accessible for user with email "jon@lajoie.ca" and role "supplier"

  @added @m6 @_done @_tested
  Scenario: I can see correct price for buyout on invoice
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier with attributes "vat_number:123,not_charge_vat:1"
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I follow translated "layout.cart.show_cart"
    And I press translated "supplier.cart.show.view.checkout_link"
    And paypal payment for user with email "jon@lajoie.ca" and role "supplier"
    And I am on the home page
    And I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.show_invoice"
    Then I should see "10" within ".invoice_data tr:nth-child(1) td:nth-child(3)"
    And I should see "1,230.00" within "td:nth-child(6) strong"
    And I should see "1230.0" within "#invoices_table td:nth-child(4)"

  @added @m6 @_done
  Scenario: I can buyout lead when I'm big buyer
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And User jon@lajoie.ca with role supplier is big buyer
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.pending_leads"
    Then I should see "1,230.00" within "#invoices_list .ta_r"

  @added @m6 @_done @tgn
  Scenario: I can buyout lead when I'm category buyer
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Computers"
    And user "jon@lajoie.ca" with role "category_supplier" has attributes "auto_buy_enabled:false"
    And User jon@lajoie.ca with role category_supplier is big buyer
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow translated "layout.main_menu.shared.browse_leads"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.pending_leads"
    Then I should see "1,230.00" within "#invoices_list .ta_r"

  @added @m6 @_done @_tested
  Scenario: I can't buyout lead when it's in other users cart
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_link"
    And I sign out
    And I am on the home page
    And I am signed up and confirmed as user with email jessica@lajoie.ca and password secret and role supplier
    And I sign in as jessica@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    Then I should not see translated "leads.index.add_to_cart_buyout_link" in the "1" row of table "table.leads_table tbody"
    And I should not see translated "leads.listing.buyout_price_label" in the "1" row of table "table.leads_table tbody"

  @added @m6 @_done @_tested
  Scenario: I can buyout lead beign a guest and signing in
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I sign in as jon@lajoie.ca with password secret
    Then I should see "1,230.00" within "div.cart_content"
    And I should see "10 x" within "div.cart_content"

  @added @m6 @_done @_tested
  Scenario: I can't buyout a lead as guest when it's bought by other user
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And a lead Printers exists within category Computers and is bought by user jessica@lajoie.ca with role supplier
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I go to browse leads
    And I follow category "Computers"
    Then I should not see translated "leads.index.add_to_cart_buyout_link" in the "1" row of table "table.leads_table tbody"
    And I should not see translated "leads.listing.buyout_price_label" in the "1" row of table "table.leads_table tbody"

  @added @m6 @_done @_tested
  Scenario: Admin should see correct total price on debtors page for buyouts
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And User jon@lajoie.ca with role supplier is big buyer
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I sign out
    Given I am signed up and confirmed as user with email admin@lajoie.ca and password secret and role admin
    And I sign in as admin@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.upcoming_invoices"
    Then I should see "1,230.00" within "#invoices_list tr:nth-child(2) td:nth-child(8)"

  @added @m6 @_done @_tested
  Scenario: Admin should see correct values on invoice generated for big buyer from buyouts
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier with attributes "not_charge_vat:1"
    And User jon@lajoie.ca with role supplier is big buyer
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And lead "Printers" has currency "EUR"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I sign out
    Given I am signed up and confirmed as user with email admin@lajoie.ca and password secret and role admin
    And I sign in as admin@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.upcoming_invoices"
    And I fill in "search_with_keyword" with "Printers"
    And I press translated "administration.upcoming_invoices.index.view.search_button"
    And I follow translated "administration.upcoming_invoices.index.view.create_invoice"
    And I follow translated "administration.invoices.edit.view.show_invoice"
    Then I should see "10" within ".invoice_data tr:nth-child(1) td:nth-child(3)"
    And I should see "1,230.00" within "tr:nth-child(3) td:nth-child(3)"

  #Buyout from my leads page - i.e. you have bought lead once -> decided it is so good that it is worth buying out -> click buyout lead and buy remaining instances
  @_requested @m8 @ao @_done @_tested
  Scenario: I can buy out remaining leads if I previously bought only one
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier with attributes "not_charge_vat:1"
    And User jon@lajoie.ca with role supplier is big buyer
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.buy_lead"
    And I go to browse leads
    And I follow category "Computers"
    Then I should not see "Printers"
    When I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.pending_leads"
    Then I should see "123.00" within "#invoices_list .ta_r"
    When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
    Then I should see "Printers"
    When I follow translated "leads.index.add_to_cart_buyout_link"
    And I follow translated "layout.main_menu.lead_supplier.lead_purchases"
    Then I should see "2" rows in a table with headers within ".leads_table tbody"
    When I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.pending_leads"
    Then I should see "2" rows in a table with headers within "#not_invoiced_leads"
    And I should see "123.00"
    And I should see "1,107.00"

  @_requested @m8 @ao @_done @_tested
  Scenario: I can see 2 transactions when I buyout after buying only one
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier with attributes "not_charge_vat:1"
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_link"
    And cart for user "jon@lajoie.ca" is paid by paypal
    And I am on the home page
    When I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.paid_invoices"
    Then I should see "123.00"
    When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
    Then I should see "Printers"
    When I follow translated "leads.index.add_to_cart_buyout_link"
    And cart for user "jon@lajoie.ca" is paid by paypal
    And I am on the home page
    When I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.paid_invoices"
    Then I should see "123.00"
    And I should see "1,107.00"
    When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
    Then I should see "2" rows in a table with headers within ".leads_table tbody"
