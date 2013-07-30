class Nbs < Thor
  require File.expand_path('config/environment.rb')

  desc "seed", ""

  def seed
    puts "running seed"

    require "spec/support/blueprints"
    #Default settings
    Settings.default_payout_delay = 0 if Settings.default_payout_delay.nil?
    Settings.default_leads_per_page = 5 if Settings.default_leads_per_page.nil?
    Settings.default_deals_per_page = 30 if Settings.default_deals_per_page.nil?
    Settings.certification_level_1 = 10 if Settings.certification_level_1.nil?
    Settings.certification_level_2 = 20 if Settings.certification_level_2.nil?
    Settings.logout_time = 5 if Settings.logout_time.nil? #minutes 
    Settings.contact_us_email = (Rails.env.production? or Rails.env.test?) ? "admin@fairleads.com" : "contact@nbs.fake.com" if Settings.contact_us_email.nil?
    Settings.contact_us_phone = Rails.env.production? ? "" : "+44 0000000" if Settings.contact_us_phone.nil?
    Settings.contact_us_skype = Rails.env.production? ? "" : "fairleads_contact" if Settings.contact_us_skype.nil?
    # Invoicing
    Settings.invoicing_default_payment_deadline_date = 14 if Settings.invoicing_default_payment_deadline_date.nil?
    Settings.big_supplier_purchase_limit = 10000 if Settings.big_supplier_purchase_limit.nil?
    #Certification
    Settings.resend_certification_notification_after_days = 15 if Settings.resend_certification_notification_after_days.nil?
    Settings.expire_certification_notification_after_days = 15 if Settings.expire_certification_notification_after_days.nil?
    Settings.default_deal_admin_email = Rails.env.production? ? "" : "agent@nbs.com" if Settings.default_deal_admin_email.nil?
    # email verification settings
    Settings.email_verification_for_members = "0" if Settings.email_verification_for_members.nil?
    Settings.email_verification_for_suppliers = "0" if Settings.email_verification_for_suppliers.nil?
    Settings.default_max_auto_buy_per_4_weeks = 5 if Settings.default_max_auto_buy_per_4_weeks.nil?
    Settings.default_group_deal_min_leads_created = 5 if Settings.default_group_deal_min_leads_created.nil?
    Settings.number_of_secondary_featured_deals = 3 if Settings.number_of_secondary_featured_deals.nil?
    Settings.cm_confirmation_email = Rails.env.production? ? "admin@fairleads.com" : "fairleads@selleo.com" if Settings.cm_confirmation_email.nil?

    Country.find_or_create_by_name("Denmark", :locale => "da", :detailed_locale => "da", :vat_rate => VatRate.new(:rate => 25))
    Country.find_or_create_by_name("United Kingdom", :locale => "en", :detailed_locale => "gb", :vat_rate => VatRate.new(:rate => 20))

    if BankAccount.count == 0
      BankAccount.create(
          :bank_name => 'Default Bank',
          :iban_no => 'DK00 0000 0000 0000 00',
          :local_bank_number => '0',
          :swift => 'DKDKDK',
          :country_default => true,
          :global_default => true,
          :address => Address.make!(:country => Country.where(:name => 'Denmark').first)
      )
    end

    if Seller.count == 0
      Seller.create(
          :company_name => "Default Seller",
          :first_name => "Change",
          :last_name => "Change",
          :vat_no => '111',
          :address => Address.make!(:country => Country.where(:name => 'Denmark').first),
          :default => true,
          :bank_account => BankAccount.first
      )
    end

    puts "Creating default PayPal currencies..."
    [
        {:name => 'AUD', :symbol => 'A &#36;', :format => '%u%n', :active => false},
        {:name => 'CAD', :symbol => 'C &#36;', :format => '%u%n', :active => false},
        {:name => 'EUR', :symbol => '&euro;', :format => '%u%n', :active => true, :exchange_rate => 1},
        {:name => 'GBP', :symbol => '&pound;', :format => '%u%n', :active => false},
        {:name => 'JPY', :symbol => '&yen;', :format => '%u%n', :active => false},
        {:name => 'USD', :symbol => '&#36;', :format => '%u%n', :active => false},
        {:name => 'NZD', :symbol => '&#36;', :format => '%u%n', :active => false},
        {:name => 'CHF', :symbol => 'CHF', :format => '%u %n', :active => false},
        {:name => 'HKD', :symbol => '&#36;', :format => '%u%n', :active => false},
        {:name => 'SGD', :symbol => '&#36;', :format => '%u%n', :active => false},
        {:name => 'SEK', :symbol => 'SEK', :format => '%u %n', :active => false},
        {:name => 'DKK', :symbol => 'DKK', :format => '%u %n', :active => true},
        {:name => 'PLN', :symbol => 'PLN', :format => '%u %n', :active => ENV["RAILS_ENV"] == 'test' ? true : false},
        {:name => 'NOK', :symbol => 'NOK', :format => '%u %n', :active => false},
        {:name => 'HUF', :symbol => 'HUF', :format => '%u %n', :active => false},
        {:name => 'CZK', :symbol => 'CZK', :format => '%u %n', :active => false},
        {:name => 'ILS', :symbol => 'ILS', :format => '%u %n', :active => false},
        {:name => 'MXN', :symbol => 'MXN', :format => '%u %n', :active => false},
        {:name => 'PHP', :symbol => 'PHP', :format => '%u %n', :active => false},
        {:name => 'TWD', :symbol => 'TWD', :format => '%u %n', :active => false},
        {:name => 'THB', :symbol => 'THB', :format => '%u %n', :active => false}
    ].each do |params|
      Currency.create(params)
    end

    if Currency.default_currency.blank?
      Currency.where(:name => "DKK").first.update_attribute(:global_default, true)
    end

    email_templates_array = [
        {:name => "confirmation instructions",
         :uniq_id => "confirmation_instructions",
         :en => {:subject => "Confirmation instructions",
                 :body => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>"},
         :da => {:subject => "[DK] Confirmation instructions",
                 :body => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>"}
        },

        {:name => "reset_password_instructions",
         :uniq_id => "reset_password_instructions",
         :en => {:subject => "Reset password instructions",
                 :body => "<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href=\"{{ user.reset_password_instructions_url }}\">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>"},
         :da => {:subject => "[DK] Reset password instructions",
                 :body => "<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href=\"{{ user.reset_password_instructions_url }}\">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>"}
        },

        {:name => "Share leads by email message",
         :uniq_id => "share_leads_by_email_message",
         :en => {:subject => "Somebody shared leads with you",
                 :body => "{% for lead in leads %}
<p>{{lead.header}}<br />
{{lead.description}}<br />
{{lead.hidden_description}}<br />
Contact: {{lead.contact_name}}, e-mail: {{lead.email_address}}, phone: {{lead.phone_number}}, {{lead.direct_phone_number}}</p>
{% endfor %}"},
         :da => {:subject => "[DK] Somebody shared leads with you",
                 :body => "{% for lead in leads %}
<p>{{lead.header}}<br />
{{lead.description}}<br />
{{lead.hidden_description}}<br />
Contact: {{lead.contact_name}}, e-mail: {{lead.email_address}}, phone: {{lead.phone_number}}, {{lead.direct_phone_number}}</p>
{% endfor %}"}
        },

        {:name => "Contact Lead by email message",
         :uniq_id => "contact_lead_by_email_message",
         :en => {:subject => "Contact regarding lead",
                 :body => "<p>{{lead.id}}</p>"},
         :da => {:subject => "[DK] Contact regarding lead",
                 :body => "<p>{{lead.id}}</p>"}
        },

        {:name => "Lead Purchase is about to expire",
         :uniq_id => "lead_purchase_is_about_to_expire",
         :en => {:subject => "Lead Purchase is about to expire",
                 :body => "<p>{{lead_purchase.id}}</p>"},
         :da => {:subject => "[DK] Lead Purchase is about to expire",
                 :body => "<p>{{lead_purchase.id}}</p>"}
        },

        {:name => "Lead rated as unsatisfactory",
         :uniq_id => "lead_rated_as_unsatisfactory",
         :en => {:subject => "Lead has been rated as unsatisfactory",
                 :body => "<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>"},
         :da => {:subject => "[DK] Lead has been rated as unsatisfactory",
                 :body => "<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>"}
        },

        {:name => "Notify buyers about lead update",
         :uniq_id => "notify_buyers_about_lead_update",
         :en => {:subject => "Lead has been updated",
                 :body => "<p>Lead {{lead.header}} has been updated by agent.</p>"},
         :da => {:subject => "[DK] Lead has been updated",
                 :body => "<p>Lead {{lead.header}} has been updated by agent.</p>"}
        },

        {:name => "Contact us",
         :uniq_id => "contact_us",
         :en => {:subject => "Question",
                 :body => "<p></p>"},
         :da => {:subject => "[DK] Question",
                 :body => "<p></p>"}
        },

        {:name => "Invoice",
         :uniq_id => "invoice",
         :en => {:subject => "Invoice",
                 :body => "<p></p>"},
         :da => {:subject => "[DK] Invoice",
                 :body => "<p></p>"}
        },

        {
            :name => "Category request",
            :uniq_id => "category_request",
            :en => {:subject => "Category request",
                    :body => "<p>{{request_type}} category request:</p><p>Category name: {{category_name}}</p><p>Lead description: {{lead_description}}</p><p>Leads count per month: {{leads_count_per_month}}</p><p>Can be contacted: {{can_be_contacted}}</p>"},
            :da => {:subject => "[DK] Category request",
                    :body => "<p>{{request_type}} category request:</p><p>Category name: {{category_name}}</p><p>Lead description: {{lead_description}}</p><p>Leads count per month: {{leads_count_per_month}}</p><p>Can be contacted: {{can_be_contacted}}</p>"}
        },
        {
            :name => "More leads request",
            :uniq_id => "more_leads_request",
            :en => {:subject => "More leads request",
                    :body => "<p>More leads request:</p><p>Category name: {{category_name}}</p><p>Company name: {{company_name}}</p><p>Contact name: {{contact_name}}</p><p>Contact email: {{contact_email}}</p><p>Contact phone: {{contact_phone}}</p><p>>Note: {{note}}</p>"},
            :da => {:subject => "[DK] More leads  request",
                    :body => "<p>More leads request:</p><p>Category name: {{category_name}}</p><p>Company name: {{company_name}}</p><p>Contact name: {{contact_name}}</p><p>Contact email: {{contact_email}}</p><p>Contact phone: {{contact_phone}}</p><p>>Note: {{note}}</p>"}
        },
        {
            :name => "Certification request",
            :uniq_id => "certification_request",
            :en => {:subject => "Certification request",
                    :body => "<p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"},
            :da => {:subject => "[DK] Certification request",
                    :body => "[DK] <p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"}
        },
            {
            :name => "bought lead notification",
            :uniq_id => "bought_lead_notification",
            :en => {:subject => "Bought lead notification",
                    :body => "<p>{{lead_purchase.header}}</p><p>{{lead_purchase.description}}</p><p>{{lead_purchase.hidden_description}}</p><p>Contact: {{lead_purchase.contact_title}} {{lead_purchase.contact_name}}</p><p>Company: {{lead_purchase.company_name}}</p><p>E-mail: {{lead_purchase.email_address}}</p><p>Phone: {{lead_purchase.phone_number}}, direct phone: {{lead_purchase.direct_phone_number}}</p><p>Address: {{lead_purchase.address}}</p><p>Link to lead: {{lead_purchase.url}}</p>"},
            :da => {:subject => "[DK] Bought lead notification",
                    :body => "[DK] <p>{{lead_purchase.header}}</p><p>{{lead_purchase.description}}</p><p>{{lead_purchase.hidden_description}}</p><p>Contact: {{lead_purchase.contact_title}} {{lead_purchase.contact_name}}</p><p>Company: {{lead_purchase.company_name}}</p><p>E-mail: {{lead_purchase.email_address}}</p><p>Phone: {{lead_purchase.phone_number}}, direct phone: {{lead_purchase.direct_phone_number}}</p><p>Address: {{lead_purchase.address}}</p><p>Link to lead: {{lead_purchase.url}}</p>"}
        },
        {
            :name => "Certification request reminder",
            :uniq_id => "certification_request_reminder",
            :en => {:subject => "Certification request reminder",
                    :body => "<p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"},
            :da => {:subject => "[DK] Certification request reminder",
                    :body => "[DK] <p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"}
        },
        {:name => "Lead notification instant",
         :uniq_id => "lead_notification_instant",
         :en => {:subject => "New lead has been added to the subscribed category",
                 :body => "<p>New lead&nbsp;<a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a>&nbsp;has been created in category {{lead.category_name}}</p>"},
         :da => {:subject => "[DK] New lead has been added to the subscribed category",
                 :body => "<p>New lead&nbsp;<a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a>&nbsp;has been created in category {{lead.category_name}}</p>"}
        },
        {:name => "Lead notification daily",
         :uniq_id => "lead_notification_daily",
         :en => {:subject => "New leads added to your subscribed categories today",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"},
         :da => {:subject => "[DK] New leads added to your subscribed categories today",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"}
        },
        {:name => "Lead notification weekly",
         :uniq_id => "lead_notification_weekly",
         :en => {:subject => "New leads added to your subscribed categories this week",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"},
         :da => {:subject => "[DK] New leads added to your subscribed categories this week",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"}
        },
        {
            :name => "Additional materials",
            :uniq_id => "result_send_material",
            :en => {:subject => "Additional materials",
                    :body => "<p></p>"},
            :da => {:subject => "[DK] Additional materials",
                    :body => "<p></p>"}
        },
        {
            :name => "Upgrade contact to category buyer",
            :uniq_id => "upgrade_contact_to_category_buyer",
            :en => {:subject => "You have been upgraded to category buyer",
                    :body => "<p>Fairleads username: {{user.email}}</p><p>Fairleads password: {{password}}</p><p>Screen name: {{user.screen_name}}</p><p><a href=\"{{user.category_supplier_category_home_url}}\">{{user.category_supplier_category_home_url}}</a></p>"},
            :da => {:subject => "[DK] You have been upgraded to category buyer",
                    :body => "<p>Fairleads username: {{user.email}}</p><p>Fairleads password: {{password}}</p><p>Screen name: {{user.screen_name}}</p><p><a href=\"{{user.category_supplier_category_home_url}}\">{{user.category_supplier_category_home_url}}</a></p>"}
        },
        {
            :name => "Upgrade contact to buyer",
            :uniq_id => "upgrade_contact_to_buyer",
            :en => {:subject => "You have been upgraded to buyer",
                    :body => "<p>Fairleads username: {{user.email}}</p><p>Fairleads password: {{password}}</p><p>Screen name: {{user.screen_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"},
            :da => {:subject => "[DK] You have been upgraded to buyer",
                    :body => "<p>Fairleads username: {{user.email}}</p><p>Fairleads password: {{password}}</p><p>Screen name: {{user.screen_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"}
        },
        {
            :name => "Upgrade contact to member",
            :uniq_id => "upgrade_contact_to_member",
            :en => {:subject => "You have been upgraded to member",
                    :body => "<p>Fairdeals username: {{user.email}}</p><p>Fairdeals password: {{password}}</p><p>Screen name: {{user.screen_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"},
            :da => {:subject => "[DK] You have been upgraded to member",
                    :body => "<p>Fairdeals username: {{user.email}}</p><p>Fairdeals password: {{password}}</p><p>Screen name: {{user.screen_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"}
        },
        {
            :name => "Upgraded category buyer welcome",
            :uniq_id => "upgraded_contact_to_category_buyer_welcome",
            :en => {:subject => "Welcome to Fairleads.com!",
                    :body => "<p>Login: {{user.email}}</p><p>Linked with account: {{user.social_provider_name}}</p><p><a href=\"{{user.category_supplier_category_home_url}}\">{{user.category_supplier_category_home_url}}</a></p>"},
            :da => {:subject => "[DK] Welcome to Fairleads.com!",
                    :body => "<p>Login: {{user.email}}</p><p>Linked with account: {{user.social_provider_name}}</p><p><a href=\"{{user.category_supplier_category_home_url}}\">{{user.category_supplier_category_home_url}}</a></p>"}
        },
        {
            :name => "Upgraded buyer welcome",
            :uniq_id => "upgraded_contact_to_buyer_welcome",
            :en => {:subject => "Welcome to Fairleads.com!",
                    :body => "<p>Login: {{user.email}}</p><p>Linked with account: {{user.social_provider_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"},
            :da => {:subject => "[DK] Welcome to Fairleads.com!",
                    :body => "<p>Login: {{user.email}}</p><p>Linked with account: {{user.social_provider_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"}
        },
        {
            :name => "Upgraded member welcome",
            :uniq_id => "upgraded_contact_to_member_welcome",
            :en => {:subject => "Welcome to Fairdeals.dk!",
                    :body => "<p>Login: {{user.email}}</p><p>Linked with account: {{user.social_provider_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"},
            :da => {:subject => "[DK] Welcome to Fairdeals.dk!",
                    :body => "<p>Login: {{user.email}}</p><p>Linked with account: {{user.social_provider_name}}</p><p><a href=\"{{user.home_page_url}}\">{{user.home_page_url}}</a></p>"}
        },
        {
            :name => "Deal certification request",
            :uniq_id => "deal_certification_request",
            :en => {:subject => "Deal certification request from Fairleads.com.",
                    :body => "<p>Login url: <a href=\"{{deal_certification_request.login_url}}\">Certify the deal</a></p>"},
            :da => {:subject => "[DK] Deal certification request from Fairleads.com.",
                    :body => "[DK] <p>Login url: <a href=\"{{deal_certification_request.login_url}}\">Certify the deal</a></p>"}
        },
        {
            :name => "Deal certification buyer welcome",
            :uniq_id => "deal_certification_buyer_welcome",
            :en => {:subject => "Welcome to Fairleads.com!",
                    :body => "<p>Login: {{user.email}}</p><p>Password: {{password}}</p>"},
            :da => {:subject => "[DK] Welcome to Fairleads.com!",
                    :body => "<p>Login: {{user.email}}</p><p>Password: {{password}}</p>"}
        },
        {
            :name => "Share deal by email",
            :uniq_id => "share_deal_by_email",
            :en => {:subject => "{{name}} wants to share the deal with you",
                    :body => "<p>{{description}}</p><p><a href=\"{{deal_url}}\">Click here for details</a></p>"},
            :da => {:subject => "[DK] {{name}} wants to share the deal with you",
                    :body => "<p>{{description}}</p><p><a href=\"{{deal_url}}\">Click here for details</a></p>"}
        },

        {:name => "Blank template",
         :uniq_id => "blank_template",
         :en => {:subject => "{{subject_content}}",
                 :body => "{{body_content}}"},
         :da => {:subject => "{{subject_content}}",
                 :body => "{{body_content}}"}
        },

        {:name => "Member invitation",
         :uniq_id => "member_invitation",
         :en => {:subject => "Welcome to fairdeals.dk",
                 :body => "<p>Username: {{user.email}}</p><p>Password: {{new_password}}</p><p><a href=\"http://fairdeals.dk\">Login at fairdeals.dk</a></p>"},
         :da => {:subject => "[DK] Welcome to fairdeals.dk",
                 :body => "<p>Username: {{user.email}}</p><p>Password: {{new_password}}</p><p><a href=\"http://fairdeals.dk\">Login at fairdeals.dk</a></p>"}
        },

        {:name => "Supplier invitation",
         :uniq_id => "supplier_invitation",
         :en => {:subject => "Welcome to fairleads.dk",
                 :body => "<p>Username: {{user.email}}</p><p>Password: {{new_password}}</p><p><a href=\"http://fairleads.com\">Login at fairleads.com</a></p>"},
         :da => {:subject => "[DK] Welcome to fairleads.dk",
                 :body => "<p>Username: {{user.email}}</p><p>Password: {{new_password}}</p><p><a href=\"http://fairleads.com\">Login at fairleads.com</a></p>"}
        },

        {:name => "Deal request details",
         :uniq_id => "deal_request_details",
         :en => {:subject => "You have requested a deal",
                 :body => "<p><b>Name:</b> {{deal.header}}</p><p><b>Short description:</b> {{deal.description}}</p><p><b>Detailed description:</b> {{deal.hidden_description}}</p><p><b>Fine print:</b> {{deal.fine_print}}</p><p><b>Company:</b> {{deal.company_name}}</p><p><b>Company description:</b> {{deal.company_description}}</p><p><b>Contact name:</b> {{deal.contact_name}}</p><p><b>Email:</b> {{deal.email_address}}</p><p><b>Phone number:</b> {{deal.phone_number}}</p><p><b>Address:</b> {{deal.address_line_1}} {{deal.address_line_2}}, {{deal.zip_code}} {{deal.address_line_3}}</p>"},
         :da => {:subject => "[DK] You have requested a deal",
                 :body => "<p><b>Name:</b> {{deal.header}}</p><p><b>Short description:</b> {{deal.description}}</p><p><b>Detailed description:</b> {{deal.hidden_description}}</p><p><b>Fine print:</b> {{deal.fine_print}}</p><p><b>Company:</b> {{deal.company_name}}</p><p><b>Company description:</b> {{deal.company_description}}</p><p><b>Contact name:</b> {{deal.contact_name}}</p><p><b>Email:</b> {{deal.email_address}}</p><p><b>Phone number:</b> {{deal.phone_number}}</p><p><b>Address:</b> {{deal.address_line_1}} {{deal.address_line_2}}, {{deal.zip_code}} {{deal.address_line_3}}</p>"}
        },
        {:name => "Deal request for deal admin",
         :uniq_id => "deal_request_for_deal_admin",
         :en => {:subject => "{{name}} has requested a deal",
                 :body => "<p>Name: {{name}}</p><p>Phone number: {{phone_number}}</p><p>E-mail: {{email_from}}</p><p>Request: {{deal_description}}</p>"},
         :da => {:subject => "[DK] {{name}} has requested a deal",
                 :body => "<p>Name: {{name}}</p><p>Phone number: {{phone_number}}</p><p>E-mail: {{email_from}}</p><p>Request: {{deal_description}}</p>"}
        },
        {:name => "Subscription cancelled through paypal",
         :uniq_id => "subscription_cancelled_through_paypal",
         :en => {:subject => "Paypal recurring payment cancelled. Reactivate it!",
                 :body => "<p>You have cancelled Your recurring payment in Paypal.com for the Fairleads subscription. <a href=\"{{subscription.create_recurring_profile_from_next_billing_cycle_link}}\">Click here to reactivate it from next billing cycle!</a></p>"},
         :da => {:subject => "[DK] Paypal recurring payment cancelled. Reactivate it!",
                 :body => "<p>[DK] You have cancelled Your recurring payment in Paypal.com for the Fairleads subscription. <a href=\"{{subscription.create_recurring_profile_from_next_billing_cycle_link}}\">Click here to reactivate it from next billing cycle!</a></p>"}
        },
        {:name => "Free period ended for PayPal subscription",
         :uniq_id => "subscription_free_period_ended_for_paypal",
         :en => {:subject => "Free period ended for Paypal subscription. Update billing information!",
                 :body => "<p>Your free period for the Fairleads subscription has ended. <a href=\"{{subscription.create_recurring_profile_from_next_billing_cycle_link}}\">Click here to update your billing information</a></p>"},
         :da => {:subject => "[DK] Free period ended for Paypal subscription. Update billing information!",
                 :body => "<p>[DK] Your free period for the Fairleads subscription has ended. <a href=\"{{subscription.create_recurring_profile_from_next_billing_cycle_link}}\">Click here to update your billing information</a></p>"}
        },
        {:name => "Voucher notification for member",
         :uniq_id => "voucher_notification",
         :en => {:subject => "You have new voucher!",
                 :body => "<p>Congratulations! You have new voucher. You can find it in attachment.</p>"},
         :da => {:subject => "[DK]You have new voucher!",
                 :body => "<p>Congratulations! You have new voucher. You can find it in attachment.</p>"}
        },
        {:name => "Unpaid Invoice",
         :uniq_id => "unpaid_invoice",
         :en => {:subject => "Unpaid invoice {{invoice.full_number}}",
                 :body => "<p>You have unpaid invoice {{invoice.full_number}}. Click <a href=\"{{invoice.pay_via_paypal_link}}\">here to pay the invoice via Paypal</a></p>"},
         :da => {:subject => "[DK] Invoice",
                 :body => "<p><p>You have unpaid invoice {{invoice.full_number}}. Click <a href=\"{{invoice.pay_via_paypal_link}}\">here to pay the invoice via Paypal</a></p></p>"}
        },
        {:name => "agent timesheet",
         :uniq_id => "agent_timesheet",
         :en => {:subject => "Agent Timesheet is ready",
                 :body => "<p>Welcome {{user.email}}!</p><p>The Agent TImesheet report you've requested is now ready. To view it, follow this link:</p><p><a href=\"{{timesheet_url}}\">Agent Timesheet report</a></p>"},
         :da => {:subject => "[DK] Agent Timesheet is ready",
                 :body => "<p>Welcome {{user.email}}!</p><p>The Agent TImesheet report you've requested is now ready. To view it, follow this link:</p><p><a href=\"{{timesheet_url}}\">Agent Timesheet report</a></p>"},
        },
        {:name => "advanced import success",
         :uniq_id => "advanced_import_success",
         :en => {:subject => "Advanced import was successful",
                 :body => "<p>Welcome {{user.email}}!</p><p>{{counter}} items had been imported to {{target_class}}.</p>"},
         :da => {:subject => "[DK] Advanced import was successful",
                 :body => "<p>Welcome {{user.email}}!</p><p>{{counter}} items had been imported to {{target_class}}.</p>"},
        },
        {:name => "advanced import success with errors",
         :uniq_id => "advanced_import_success_with_errors",
         :en => {:subject => "Advanced import has finished but some errors were found",
                 :body => "<p>Welcome {{user.email}}!</p><p>{{counter}} items had been imported to {{target_class}}.</p><p> Errors: {{errors}}</p>"},
         :da => {:subject => "[DK] Advanced import has finished but some errors were found",
                 :body => "<p>Welcome {{user.email}}!</p><p>{{counter}} items had been imported to {{target_class}}.</p><p> Errors: {{errors}}</p>"},
        },
        {:name => "advanced import fail",
         :uniq_id => "advanced_import_fail",
         :en => {:subject => "Advanced import failed",
                 :body => "<p>Welcome {{user.email}}!</p><p>Sorry, there was problem with chosen fields while trying to import data to {{target_class}}.</p>"},
         :da => {:subject => "[DK] Advanced import failed",
                 :body => "<p>Welcome {{user.email}}!</p><p>Sorry, there was problem with chosen fields while trying to import data to {{target_class}}.</p>"},
        },
        {:name => "Voucher payment failed",
         :uniq_id => "voucher_payment_failed_notification",
         :en => {:subject => "Payment failed for voucher from deal {{deal.header}}",
                 :body => "<p>Sorry Your voucher has been cancelled since the payment did not go through. Please try again or contact Fairdeals if the problem persists.</p>"},
         :da => {:subject => "[DK] Payment failed for voucher from deal {{deal.header}}",
                 :body => "<p>Sorry Your voucher has been cancelled since the payment did not go through. Please try again or contact Fairdeals if the problem persists.</p>"}
        },

        {:name => "Survey newsletter",
         :uniq_id => "survey_newsletter",
         :en => {:subject => "New survey",
                 :body => "<p>Could you please fill out {{survey_name}} survey by clicking this <a href=\"{{survey_link}}\">link</a>.</p>"},
         :da => {:subject => "[DK] New survey",
                 :body => "<p>Could you please fill out {{survey_name}} survey by clicking this <a href=\"{{survey_link}}\">link</a>.</p>"}
        },

        {:name => "Survey campaign",
         :uniq_id => "survey_campaign",
         :en => {:subject => "New survey",
                 :body => "<p>Could you please fill out {{survey_name}} survey by clicking this <a href=\"{{survey_link}}\">link</a>.</p>"},
         :da => {:subject => "[DK] New survey",
                 :body => "<p>Could you please fill out {{survey_name}} survey by clicking this <a href=\"{{survey_link}}\">link</a>.</p>"}
        },
    ]


    #Hints
    {"lead" => %w{ company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country_id
              region_id country_id company_vat_no company_ean_number contact_name direct_phone_number phone_number email_address linkedin_url
              facebook_url category_id is_international header description hidden_description purchase_value price currency_id published
              notify_buyers_after_update sale_limit purchase_decision_date contact_title},
     "user/customer" => %w{first_name last_name company_name address_address_line_1 address_address_line_2 address_address_line_3 address_zip_code
              address_country_id address_region_id vat_number screen_name phone email password password_confirmation team_buyers agreement_read newsletter_on },
     "user/purchase_manager" => %w{first_name last_name address_address_line_1 address_address_line_2 address_address_line_3 address_zip_code address_country_id
              address_region_id phone email screen_name password password_confirmation agreement_read newsletter_on },
     "user/agent" => %w{first_name last_name address_address_line_1 address_address_line_2 address_address_line_3 address_zip_code address_country_id
              address_region_id phone email screen_name password password_confirmation agreement_read newsletter_on },
     "user/call_centre_agent" => %w{first_name last_name address_address_line_1 address_address_line_2 address_address_line_3 address_zip_code address_country_id
              address_region_id phone mobile_phone email screen_name password password_confirmation agreement_read newsletter_on department},
     "user/lead_buyer" => %w{first_name last_name mobile_phone screen_name phone email mobile_phone department lead_buyer_role_enabled password password_confirmation hide_profile_page hide_lead_prices},
     "user/lead_user" => %w{first_name last_name mobile_phone screen_name phone email mobile_phone department lead_buyer_role_enabled password password_confirmation hide_profile_page hide_lead_prices},
     "my_profile" => %w{company_name first_name last_name phone email screen_name company_ean_number address_address_line_1
              address_address_line_2 address_address_line_3 address_zip_code address_country_id address_region_id newsletter_on bank_address_address_line_1
              bank_address_address_line_2 bank_address_address_line_3 bank_address_zip_code bank_address_country_id bank_address_region_id paypal_email bank_swift_number
              bank_iban_number payout bank_name team_buyers},
     "category_request" => %w{email_from phone_number category_name lead_description leads_count_per_month_agent leads_count_per_month_buyer can_be_contacted},
     "share_leads_by_email" => %w{recipients subject body}
    }.each_pair do |klass, methods|
      methods.each do |method|
        article = Article::Cms::Hint.find_by_key("#{klass}_#{method}")
        article = Article::Cms::Hint.create(:key => "#{klass}_#{method}", :published => false) if article.nil?
        [:en, :da].each do |locale|
          ::I18n.locale = locale
          if article.content.blank?
            article.update_attributes({:content => Rails.env.production? ? "(write text here)" : "Hint for <b>#{klass.to_s}: #{method.humanize.downcase.gsub('_id', '')}</b>",
                                       :title => "#{klass.to_s.capitalize}##{method.gsub('_id', '')}"})
            article.update_attribute(:content, " ")
          end
        end
      end
    end

    email_templates_array.each do |email_template|
      unless EmailTemplate.global.find_by_uniq_id(email_template[:uniq_id])
        [:en, :da].each do |locale|
          ::I18n.locale = locale
          et = EmailTemplate.find_or_initialize_by_uniq_id({:name => email_template[:name], :persist => true,
                                                            :from => "noreply@newbizzshoppen.com",
                                                            :uniq_id => email_template[:uniq_id]})
          et.body = email_template[locale][:body]
          et.subject = email_template[locale][:subject]
          et.save!
        end
      end
    end

    puts "Creating basic free subscriptions"
    ["category_supplier", "supplier", "member"].each do |role|
      subscription_name = "Free #{role.humanize.downcase} subscription"
      unless SubscriptionPlan.where(:name => subscription_name).first.present?
        sub = SubscriptionPlan.make!(:name => subscription_name, :subscription_period => 0, :billing_period => 0, :assigned_roles => [role.to_sym], :seller => Seller.default, :currency => Currency.default_currency)
        "User::#{role.camelize}".constantize.all.each do |user|
          user.apply_subscription!(sub)
        end
      end
    end

    unless User::Admin.find_by_email("blazejek@gmail.com")
      u = User::Admin.make!(:email => "blazejek@gmail.com", :password => "secret", :password_confirmation => "secret")
      u.confirm!
      u.save
    end

    [{:name => "Call back", :final => false, :generic => true},
     {:name => "Not interested now", :final => false, :generic => true},
     {:name => "Not interested", :final => true, :generic => true},
     {:name => "Not in", :final => false, :generic => true},
     {:name => "Upgraded to lead", :final => true, :generic => true, :upgrades_to_lead => true},
     {:name => "Meeting booked", :final => true, :generic => true},
     {:name => "Custom result", :final => true, :generic => true},
     {:name => "Send material", :final => false, :generic => true},
     {:name => "Upgrade to category supplier", :final => true, :generic => true},
     {:name => "Upgrade to supplier", :final => true, :generic => true},
     {:name => "Upgrade to member", :final => true, :generic => true}].each do |result|
      Result.create(result) unless Result.find_by_name(result[:name])
    end

    [{:name => "Call back date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Call back") },
     {:name => "Call back date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Not interested now") },
     {:name => "Meeting date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Meeting booked") },
     {:name => "Result message", :field_type => "0", :is_mandatory => true, :result => Result.find_by_name("Custom result") },
     {:name => "Call back date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Send material") },
     {:name => "Material", :field_type => "5", :is_mandatory => true, :result => Result.find_by_name("Send material") },
     {:name => "Material", :field_type => "5", :is_mandatory => false, :result => Result.find_by_name("Upgrade to category supplier") },
     {:name => "Material", :field_type => "5", :is_mandatory => false, :result => Result.find_by_name("Upgrade to supplier") },
     {:name => "Material", :field_type => "5", :is_mandatory => false, :result => Result.find_by_name("Upgrade to member") }
    ].each do |result_field|
      ResultField.create(result_field) unless ResultField.find_by_name_and_result_id(result_field[:name], result_field[:result].id)
    end

    ActiveRecord::Migration.execute "UPDATE campaigns SET currency_id = #{Currency.default_currency.present? ? Currency.default_currency.id : Currency.active.first.id} WHERE currency_id IS NULL"

    # -----------------------------------------------------------------------------------------------------------------
    #                                                 DOMAINS
    # -----------------------------------------------------------------------------------------------------------------
    puts "Creating domains"
    [
      {:name => 'fairleads.com', :site => 'fairleads', :locale => 'en', :default => true},
      {:name => 'fairleads.dk', :site => 'fairleads', :locale => 'da', :default => false},
      {:name => 'fairdeals.dk', :site => 'fairdeals', :locale => 'da', :default => false},
      {:name => 'thefairdeals.com', :site => 'fairdeals', :locale => 'en', :default => false},
      {:name => 'fairdeals.eu', :site => 'fairdeals', :locale => 'en', :default => true},
      {:name => 'faircalls.dk', :site => 'faircalls', :locale => 'da', :default => false},
      {:name => 'faircalls.eu', :site => 'faircalls', :locale => 'en', :default => true}
    ].each do |domain_attrs|
      unless Domain.where(domain_attrs).first
        domain_attrs[:name] = "beta.#{domain_attrs[:name]}" if Rails.env.staging?
        Domain.create!(domain_attrs)
      end
    end

    unless Rails.env.production?

      ['LeadCategory', 'DealCategory'].map(&:constantize).each do |model_name|
        if model_name.count.zero?
          ['Electronics', 'Leisure', 'Business'].each do |name|
            name = model_name == DealCategory ? "#{name} deals" : name
            [:en, :da].each do |locale|
              ::I18n.locale = locale
              if category = model_name.where(:name => name).first
                category.name = name
                category.save
              else
                model_name.make!(:name => name)
              end
            end
          end
        end
      end

      unless User::Agent.find_by_email("agent@nbs.com")
        u = User::Agent.make!(:email => "agent@nbs.com", :password => "secret", :password_confirmation => "secret")
        u.confirm!
        u.save
      end

      if Lead.count.zero?
        ::I18n.locale = :en
        agent = User::Agent.find_by_email("agent@nbs.com")
        ["Big deal on printers", "Drills required", "Need assistance in selling a car", "Ipod shipment", "Trip to amazonia - looking for offer", "LCD - Huge amounts", "GPS receivers required"].each do |header|
          Lead.make!(:category_id => LeadCategory.last.id, :header => header, :creator_id => agent.id, :currency => Currency.where(:name => "EUR").first)
        end
      end

      LeadCategory.all.each { |c| c.send(:refresh_leads_count_cache!) }

      unless User::Admin.find_by_email("admin@nbs.com")
        u = User::Admin.make!(:email => "admin@nbs.com", :password => "secret", :password_confirmation => "secret")
        u.confirm!
        u.save
      end


      unless User::Supplier.find_by_email("buyer@nbs.com")
        u = User::Supplier.make!(:email => "buyer@nbs.com", :password => "secret", :password_confirmation => "secret")
        u.confirm!
        u.save
      end

      buyer = User::Supplier.find_by_email("buyer@nbs.com")
      unless User::LeadUser.find_by_email("leaduser@nbs.com")
        u = User::LeadUser.make!(:email => "leaduser@nbs.com", :password => "secret", :password_confirmation => "secret", :parent_id => buyer.id)
        u.confirm!
        u.save
        u = User::LeadSupplier.make!(:email => "leadbuyer@nbs.com", :password => "secret", :password_confirmation => "secret", :parent_id => buyer.id)
        u.confirm!
        u.save
      end

      user = User::LeadUser.find_by_email("leaduser@nbs.com")
      unless buyer.subaccounts.include?(user)
        buyer.subaccounts << user
      end

    end

    #Translators
    {:agent => :agent, :call_centre => :call_centre, :customer => :supplier, :purchase_manager => :member, :category_buyer => :category_supplier}.each_pair do |name, role|
      klass = "User::#{role.to_s.camelize}".constantize
      unless klass.find_by_email("translator_#{name}@nbs.com")
        if name == :category_buyer
          user = klass.make!(:email => "translator_#{name}@nbs.com", :password => "secret", :password_confirmation => "secret", :auto_buy_enabled => false, :buying_categories => [LeadCategory.first])
        elsif name == :call_centre
          user = klass.make!(:email => "translator_#{name}@nbs.com", :password => "secret", :password_confirmation => "secret", :first_name => "Johnny", :last_name => "Mnemonic")
        else
          user = klass.make!(:email => "translator_#{name}@nbs.com", :password => "secret", :password_confirmation => "secret")
        end
        user.confirm!
        user.roles << :translator
        user.save
      end
    end

    unless User::CallCentreAgent.find_by_email("translator_call_centre_agent@nbs.com")
      parent = User.find_by_email("translator_call_centre@nbs.com")
      user = User::CallCentreAgent.make!(:email => "translator_call_centre_agent@nbs.com", :first_name => "John", :last_name => "Smith", :password => "secret", :password_confirmation => "secret", :parent_id => parent.id)
      user.confirm!
      user.roles << :translator
      user.save
    end

    puts "Creating default main page articles..."
    [
        'About us',
        'Privacy',
        'Terms & Conditions',
        'Fairdeals Terms & Conditions',
        'Faircalls Terms & Conditions',
        'Erhvervsanalyse Terms & Conditions'
    ].each do |title|
      unless Article::Cms::MainPageArticle.includes(:translations).where(:article_translations => {:title => title}).first
        article = Article::Cms::MainPageArticle.make!(:title => title, :content => title, :key => title.parameterize('_'))
        [:en, :da].each do |locale|
          ::I18n.locale = locale
          article.title = title
          article.content = title
          article.save
          article.publish!
        end
      end
    end

    puts "Creating default interface content texts (blurbs)..."
    [
        'blurb_sign_up',
        'blurb_supplier_home',
        'blurb_supplier_home_logged_in',
        'blurb_agent_home',
        'blurb_agent_home_logged_in',
        'blurb_call_centre_home',
        'blurb_member_home',
        'blurb_member_home_logged_in',
        'blurb_start_page_role_selection',
        'blurb_currencies',
        'blurb_category_home',
        'blurb_leads_listing',
        'blurb_agent_contact_us',
        'blurb_supplier_contact_us',
        'blurb_resend_confirmation',
        'blurb_certification_member_signup',
        'blurb_certify_information',
        'blurb_start_page_fairdeals',
        'blurb_subscription_select',
        'blurb_subscriptions_for_supplier',
        'blurb_subscriptions_for_category supplier',
        'blurb_subscriptions_for_member',
        'blurb_deal_confirmation_page',
        'blurb_voucher_confirmation_page'
    ].each do |key|
      unless Article::Cms::InterfaceContentText.where(:key => key).first
        article = Article::Cms::InterfaceContentText.make!(:title => key.humanize, :content => key.humanize, :key => key)
        [:en, :da].each do |locale|
          ::I18n.locale = locale
          article.title = key.humanize
          article.content = key.humanize
          article.save
          article.publish!
        end
      end
    end

    puts "Creating default help popups..."
    [
        'reset_password'
    ].each do |key|
      unless Article::Cms::HelpPopup.where(:key => key).first
        article = Article::Cms::HelpPopup.make!(:title => key.humanize, :content => key.humanize, :key => key)
        [:en, :da].each do |locale|
          ::I18n.locale = locale
          article.title = key.humanize
          article.content = key.humanize
          article.save
          article.publish!
        end
      end
    end

    #Add translator roles to existing users
    User::Admin.all.each do |user|
      user.roles << :translator unless user.has_role?(:translator)
      user.save
    end

    unless Rails.env.production?
      puts "Creating testing campaign & contacts..."

      category = Category.where(:name => "Business").first
      country = Country.where(:name => "Denmark").first
      call_centre = User.where(:email => "translator_call_centre@nbs.com").first
      campaign = Campaign.find_or_create_by_name({:name => "Testing One",
                                                  :category => category,
                                                  :country => country,
                                                  :max_contact_number => 3,
                                                  :creator => call_centre,
                                                  :start_date => Date.today,
                                                  :end_date => Date.today + 14.days, :currency => Currency.euro, :cost_type => Campaign::NO_COST})
      #inactive campaign
      Campaign.find_or_create_by_name({:name => "Testing Two",
                                       :category => Category.where(:name => "Electronics").first,
                                       :country => Country.where(:name => "United Kingdom").first,
                                       :max_contact_number => 3,
                                       :creator => call_centre,
                                       :start_date => Date.today - 15.days,
                                       :end_date => Date.today - 1.days, :currency => Currency.euro, :cost_type => Campaign::NO_COST})
      campaign.results = Result.generic_results
      campaign.users = call_centre.subaccounts

      [{:company_name => "Bon Jovi inc.", :company_phone_number => "888 112 113", :email_address => "bj@bj.com", :company_vat_no => "0000099999"},
       {:company_name => "Mleko company", :company_phone_number => "510 333 333", :email_address => ""},
       {:company_name => "Stefanek corp", :company_phone_number => "888 422 633", :email_address => ""},
       {:company_name => "PHU Sciemkata", :company_phone_number => "602 222 333", :email_address => ""}].each do |attrs|
        Contact.find_or_create_by_company_name attrs.merge(:country => country, :campaign => campaign, :creator => call_centre, :category => category, :contact_name => "", :phone_number => "", :creator_name => call_centre.full_name)
      end

      Contact.where("last_call_result_at IS NULL").each do |contact|
        last_call_result = contact.call_results.order("created_at DESC").first
        contact.update_attribute(:last_call_result_at, last_call_result.created_at) if last_call_result
      end
    end
    puts "Importing languages..."

    languages = {
      "Czech" => {:code => "cs", :enabled => false, :symbol => "CZ"},
      "Danish" => {:code => "da", :enabled => true, :symbol => "DK"},
      "German" => {:code => "de", :enabled => false, :symbol => "DE"},
      "Greek" => {:code => "el", :enabled => false, :symbol => "GR"},
      "English" => {:code => "en", :enabled => true, :symbol => "EN"},
      "Spanish" => {:code => "es", :enabled => false, :symbol => "ES"},
      "Estonian" => {:code => "et", :enabled => false, :symbol => "ET"},
      "Finnish" => {:code => "fi", :enabled => false, :symbol => "FI"},
      "French" => {:code => "fr", :enabled => false, :symbol => "FR"},
      "Croatian" => {:code => "hr", :enabled => false, :symbol => "HR"},
      "Hungarian" => {:code => "hu", :enabled => false, :symbol => "HU"},
      "Icelandic" => {:code => "is", :enabled => false, :symbol => "IS"},
      "Italian" => {:code => "it", :enabled => false, :symbol => "IT"},
      "Lithuanian" => {:code => "lt", :enabled => false, :symbol => "LT"},
      "Latvian" => {:code => "lv", :enabled => false, :symbol => "LV"},
      "Norwegian" => {:code => "no", :enabled => false, :symbol => "NO"},
      "Dutch" => {:code => "nl", :enabled => false, :symbol => "NL"},
      "Polish" => {:code => "pl", :enabled => false, :symbol => "PL"},
      "Portuguese" => {:code => "pt", :enabled => false, :symbol => "PT"},
      "Russian" => {:code => "ru", :enabled => false, :symbol => "RU"},
      "Slovak" => {:code => "sk", :enabled => false, :symbol => "SK"},
      "Slovene" => {:code => "sl", :enabled => false, :symbol => "SL"},
      "Swedish" => {:code => "sv", :enabled => false, :symbol => "SV"},
      "Turkish" => {:code => "tr", :enabled => false, :symbol => "TR"},
      "Ukrainian" => {:code => "uk", :enabled => false, :symbol => "uk"}
    }

    languages.each do |lang,attrs|
      unless Locale.where(:code => attrs[:code]).present?
        Locale.create!(:code => attrs[:code], :language => lang, :enabled => attrs[:enabled], :symbol => attrs[:symbol])
      end
    end

    #create proc translations
    #based on https://github.com/rails/rails/blob/master/activesupport/lib/active_support/locale/en.yml
    Translation.create_or_update!(:locale => "en", :key => "date.month_names", :is_proc => true, :value => "%w{nil January February March April May June July August September October November December}")
    Translation.create_or_update!(:locale => "da", :key => "date.month_names", :is_proc => true, :value => "%w{nil januar februar marts april maj juni juli august september oktober november december}")

    Translation.create_or_update!(:locale => "en", :key => "date.abbr_month_names", :is_proc => true, :value => "%w{nil Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec}")
    Translation.create_or_update!(:locale => "da", :key => "date.abbr_month_names", :is_proc => true, :value => "%w{nil jan feb mar apr maj jun jul aug sep okt nov dec}")

    Translation.create_or_update!(:locale => "en", :key => "date.day_names", :is_proc => true, :value => "%w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday}")
    Translation.create_or_update!(:locale => "da", :key => "date.day_names", :is_proc => true, :value => "%w{søndag mandag tirsdag onsdag torsdag fredag lørdag}")

    Translation.create_or_update!(:locale => "en", :key => "date.abbr_day_names", :is_proc => true, :value => "%w{Sun Mon Tue Wed Thu Fri Sat}")
    Translation.create_or_update!(:locale => "da", :key => "date.abbr_day_names", :is_proc => true, :value => "%w{søn man tir ons tor fre lør}")
  end

  desc "recalculate_leads_average_ratings", ""

  def recalculate_leads_average_ratings
    CommonStats.new.recalculate_leads_average_ratings
  end

  desc "refresh_subaccounts_counters", ""

  def refresh_subaccounts_counters
    CommonStats.new.refresh_subaccounts_counters
  end

  desc "refresh_agent_counters", ""

  def refresh_agent_counters
    CommonStats.new.refresh_agent_counters
  end

  desc "refresh_buyer_counters", ""

  def refresh_buyer_counters
    CommonStats.new.refresh_buyer_counters
  end

  desc "refresh_exchange_rates", ""
  # updated daily between 2.15 p.m. and 3.00 p.m. CET
  def refresh_exchange_rates
    CurrencyConverter.cache_current_exchange_rates!
  end

  desc "copy yml to database", ""

  def t
    ::I18nUtils.populate!
  end

  desc "check lead certification requests", ""

  def check_lead_certification_requests
    LeadCertificationRequest.active.each do |lead_certification_request|
      lead_certification_request.update_state!
    end
  end

  desc "send_daily_lead_notifications", ""

  def send_daily_lead_notifications
    CommonNotifications.send_daily_lead_notifications!
  end

  desc "send_weekly_lead_notifications", ""

  def send_weekly_lead_notifications
    CommonNotifications.send_weekly_lead_notifications!
  end

  desc "prolong_subscriptions_daily", ""

  def prolong_subscriptions_daily
    Subscription.auto_prolong
  end

  desc "create_unpaid_invoices_for_unpaid_sub_periods", ""

  def create_unpaid_invoices_for_unpaid_sub_periods
    SubscriptionSubPeriod.create_unpaid_invoices_for_unpaid_sub_periods
  end

  desc "send_end_of_free_period_email", ""

  def send_end_of_free_period_email
    Subscription.send_reminder_about_end_of_free_period
  end

  desc "synchronize newsletter lists", ""

  def synchronize_newsletter_lists
    NewsletterSynch.process!
  end

  desc "surveys_send_link_not_clicked_chain_mails", ""

  def surveys_send_link_not_clicked_chain_mails
    SurveyRecipient.send_link_not_clicked_chain_mails!
  end

  desc "merge_regular_user_session_logs", ""

  def merge_regular_user_session_logs
    UserSessionLog.regular_type.each(&:merge_regular!)
  end

  desc "import_contacts_from_newsletter_lists", ""

  def import_contacts_from_newsletter_lists
    Campaign.where(:import_contacts_from_lists => true).each do |campaign|
      campaign.import_contacts_from_lists!
    end
  end
end