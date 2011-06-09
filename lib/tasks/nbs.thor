class Nbs < Thor
  require File.expand_path('config/environment.rb')

  desc "seed", ""

  def seed
    puts "running seed"

    require "spec/support/blueprints"
    #Default settings
Settings.default_payout_delay = 0 if Settings.default_payout_delay.nil?
    Settings.default_leads_per_page = 5 if Settings.default_leads_per_page.nil?
    Settings.certification_level_1 = 10 if Settings.certification_level_1.nil?
    Settings.certification_level_2 = 20 if Settings.certification_level_2.nil?
    Settings.logout_time = 5 if Settings.logout_time.nil? #minutes 
    Settings.contact_us_email = "contact@nbs.fake.com" if Settings.contact_us_email.nil?
    # Invoicing
    Settings.invoicing_default_payment_deadline_date = 14 if Settings.invoicing_default_payment_deadline_date.nil?
    Settings.big_buyer_purchase_limit = 10000 if Settings.big_buyer_purchase_limit.nil?
    #Certification
    Settings.resend_certification_notification_after_days = 15 if Settings.resend_certification_notification_after_days.nil?
    Settings.expire_certification_notification_after_days = 15 if Settings.expire_certification_notification_after_days.nil?
    #Youtube introduction
    Settings.youtube_introduction = "" if Settings.youtube_introduction.nil?

    Country.find_or_create_by_name("Denmark", :locale => "dk", :detailed_locale => "dk", :vat_rate => VatRate.new(:rate => 25))
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

    email_templates_array = [
        {:name => "confirmation instructions",
         :uniq_id => "confirmation_instructions",
         :en => {:subject => "Confirmation instructions",
                 :body => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>"},
         :dk => {:subject => "[DK] Confirmation instructions",
                 :body => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>"}
        },

        {:name => "reset_password_instructions",
         :uniq_id => "reset_password_instructions",
         :en => {:subject => "Reset password instructions",
                 :body => "<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href=\"{{ user.reset_password_instructions_url }}\">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>"},
         :dk => {:subject => "[DK] Reset password instructions",
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
         :dk => {:subject => "[DK] Somebody shared leads with you",
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
         :dk => {:subject => "[DK] Contact regarding lead",
                 :body => "<p>{{lead.id}}</p>"}
        },

        {:name => "Lead Purchase is about to expire",
         :uniq_id => "lead_purchase_is_about_to_expire",
         :en => {:subject => "Lead Purchase is about to expire",
                 :body => "<p>{{lead_purchase.id}}</p>"},
         :dk => {:subject => "[DK] Lead Purchase is about to expire",
                 :body => "<p>{{lead_purchase.id}}</p>"}
        },

        {:name => "Lead rated as unsatisfactory",
         :uniq_id => "lead_rated_as_unsatisfactory",
         :en => {:subject => "Lead has been rated as unsatisfactory",
                 :body => "<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>"},
         :dk => {:subject => "[DK] Lead has been rated as unsatisfactory",
                 :body => "<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>"}
        },

        {:name => "Notify buyers about lead update",
         :uniq_id => "notify_buyers_about_lead_update",
         :en => {:subject => "Lead has been updated",
                 :body => "<p>Lead {{lead.header}} has been updated by agent.</p>"},
         :dk => {:subject => "[DK] Lead has been updated",
                 :body => "<p>Lead {{lead.header}} has been updated by agent.</p>"}
        },

        {:name => "Contact us",
         :uniq_id => "contact_us",
         :en => {:subject => "Question",
                 :body => "<p></p>"},
         :dk => {:subject => "[DK] Question",
                 :body => "<p></p>"}
        },

        {:name => "Invoice",
         :uniq_id => "invoice",
         :en => {:subject => "Invoice",
                 :body => "<p></p>"},
         :dk => {:subject => "[DK] Invoice",
                 :body => "<p></p>"}
        },

        {
            :name => "Category request",
            :uniq_id => "category_request",
            :en => {:subject => "Category request",
                    :body => "<p>{{request_type}} category request:</p><p>Category name: {{category_name}}</p><p>Lead description: {{lead_description}}</p><p>Leads count per month: {{leads_count_per_month}}</p><p>Can be contacted: {{can_be_contacted}}</p>"},
            :dk => {:subject => "[DK] Category request",
                    :body => "<p>{{request_type}} category request:</p><p>Category name: {{category_name}}</p><p>Lead description: {{lead_description}}</p><p>Leads count per month: {{leads_count_per_month}}</p><p>Can be contacted: {{can_be_contacted}}</p>"}
        },
        {
            :name => "Certification request",
            :uniq_id => "certification_request",
            :en => {:subject => "Certification request",
                    :body => "<p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"},
            :dk => {:subject => "[DK] Certification request",
                    :body => "[DK] <p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"}
        },
        {
            :name => "Certification request reminder",
            :uniq_id => "certification_request_reminder",
            :en => {:subject => "Certification request reminder",
                    :body => "<p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"},
            :dk => {:subject => "[DK] Certification request reminder",
                    :body => "[DK] <p>Login url: {{lead_certification_request.login_url}}</p><p>Contact name: {{lead_certification_request.contact_name}}</p><p>Contact email: {{lead_certification_request.contact_email}}</p>"}
        },
        {:name => "Lead notification instant",
         :uniq_id => "lead_notification_instant",
         :en => {:subject => "New lead has been added to the subscribed category",
                 :body => "<p>New lead&nbsp;<a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a>&nbsp;has been created in category {{lead.category_name}}</p>"},
         :dk => {:subject => "[DK] New lead has been added to the subscribed category",
                 :body => "<p>New lead&nbsp;<a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a>&nbsp;has been created in category {{lead.category_name}}</p>"}
        },
        {:name => "Lead notification daily",
         :uniq_id => "lead_notification_daily",
         :en => {:subject => "New leads added to your subscribed categories today",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"},
         :dk => {:subject => "[DK] New leads added to your subscribed categories today",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"}
        },
        {:name => "Lead notification weekly",
         :uniq_id => "lead_notification_weekly",
         :en => {:subject => "New leads added to your subscribed categories this week",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"},
         :dk => {:subject => "[DK] New leads added to your subscribed categories this week",
                 :body => "<p>{% for lead in leads %}<p><a href=\"{{lead.show_lead_details_url}}\">{{lead.header}}</a><br />{{lead.description}}</p>{% endfor %}</p>"}
        }
    ]

    #Hints
    {"lead" => %w{ company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country_id
              region_id country_id company_vat_no company_ean_number contact_name direct_phone_number phone_number email_address linkedin_url
              facebook_url category_id is_international header description hidden_description purchase_value price currency_id published
              notify_buyers_after_update sale_limit purchase_decision_date},
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
     "my_profile" => %w{company_name first_name last_name phone email screen_name company_registration_number company_ean_number address_address_line_1
              address_address_line_2 address_address_line_3 address_zip_code address_country_id address_region_id newsletter_on bank_address_address_line_1
              bank_address_address_line_2 bank_address_address_line_3 bank_address_zip_code bank_address_country_id bank_address_region_id paypal_email bank_swift_number
              bank_iban_number payout bank_name team_buyers},
     "category_request" => %w{email_from phone_number category_name lead_description leads_count_per_month_agent leads_count_per_month_buyer can_be_contacted},
     "share_leads_by_email" => %w{recipients subject body}
    }.each_pair do |klass, methods|
      methods.each do |method|
        article = Article::Cms::Hint.find_by_key("#{klass}_#{method}")
        article = Article::Cms::Hint.create(:key => "#{klass}_#{method}", :published => false) if article.nil?
        [:en, :dk].each do |locale|
          I18n.locale = locale
          if article.content.blank?
            article.update_attributes({:content => Rails.env.production? ? "(write text here)" : "Hint for <b>#{klass.to_s}: #{method.humanize.downcase.gsub('_id', '')}</b>",
                                       :title => "#{klass.to_s.capitalize}##{method.gsub('_id', '')}"})
            article.update_attribute(:content, " ")
          end
        end
      end
    end

    email_templates_array.each do |email_template|
      unless EmailTemplate.find_by_uniq_id(email_template[:uniq_id])
        [:en, :dk].each do |locale|
          I18n.locale = locale
          et = EmailTemplate.find_or_initialize_by_uniq_id({:name => email_template[:name], :persist => true,
                                                            :from => "noreply@newbizzshoppen.com",
                                                            :uniq_id => email_template[:uniq_id]})
          et.body = email_template[locale][:body]
          et.subject = email_template[locale][:subject]
          et.save!
        end
      end
    end

    unless User::Admin.find_by_email("blazejek@gmail.com")
      u = User::Admin.make!(:email => "blazejek@gmail.com", :password => "secret", :password_confirmation => "secret", :screen_name => "root")
      u.confirm!
      u.save
    end


    puts "Creating default PayPal currencies..."
    [
        {:name => 'AUD', :symbol => 'A &#36;', :format => '%u%n', :active => false},
        {:name => 'CAD', :symbol => 'C &#36;', :format => '%u%n', :active => false},
        {:name => 'EUR', :symbol => '&euro;', :format => '%u%n', :active => true},
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

    [{:name => "Call back", :final => false, :generic => true},
     {:name => "Not interested now", :final => false, :generic => true},
     {:name => "Not interested", :final => true, :generic => true},
     {:name => "Not in", :final => false, :generic => true},
     {:name => "Upgraded to lead", :final => true, :generic => true, :upgrades_to_lead => true},
     {:name => "Meeting booked", :final => true, :generic => true},
     {:name => "Custom result", :final => true, :generic => true},
     {:name => "Send material", :final => false, :generic => true}].each do |result|
      Result.create(result) unless Result.find_by_name(result[:name])
    end

    [{:name => "Call back date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Call back") },
     {:name => "Call back date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Not interested now") },
     {:name => "Meeting date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Meeting booked") },
     {:name => "Result message", :field_type => "0", :is_mandatory => true, :result => Result.find_by_name("Custom result") },
     {:name => "Call back date", :field_type => "4", :is_mandatory => true, :result => Result.find_by_name("Send material") },
     {:name => "Material", :field_type => "5", :is_mandatory => true, :result => Result.find_by_name("Send material") }].each do |result_field|
      ResultField.create(result_field) unless ResultField.find_by_name_and_result_id(result_field[:name], result_field[:result].id)
    end

    unless Rails.env.production?

      if Category.count.zero?
        ['Electronics', 'Leisure', 'Business'].each do |name|
          [:en, :dk].each do |locale|
            I18n.locale = locale
            if category = Category.where(:name => name).first
              category.name = name
              category.save
            else
              Category.make!(:name => name)
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
        agent = User::Agent.find_by_email("agent@nbs.com")
        ["Big deal on printers", "Drills required", "Need assistance in selling a car", "Ipod shipment", "Trip to amazonia - looking for offer", "LCD - Huge amounts", "GPS receivers required"].each do |header|
          Lead.make!(:category_id => Category.last.id, :header => header, :creator_id => agent.id, :currency => Currency.where(:name => "EUR").first)
        end
      end

      Category.all.each { |c| c.send(:refresh_leads_count_cache!) }

      unless User::Admin.find_by_email("admin@nbs.com")
        u = User::Admin.make!(:email => "admin@nbs.com", :password => "secret", :password_confirmation => "secret")
        u.confirm!
        u.save
      end


      unless User::Customer.find_by_email("buyer@nbs.com")
        u = User::Customer.make!(:email => "buyer@nbs.com", :password => "secret", :password_confirmation => "secret", :big_buyer => true)
        u.confirm!
        u.save
      end

      unless User::LeadUser.find_by_email("leaduser@nbs.com")
        u = User::LeadUser.make!(:email => "leaduser@nbs.com", :password => "secret", :password_confirmation => "secret")
        u.confirm!
        u.save
      end


      buyer = User::Customer.find_by_email("buyer@nbs.com")
      user = User::LeadUser.find_by_email("leaduser@nbs.com")


      unless buyer.subaccounts.include?(user)
        buyer.subaccounts << user
      end

    end

    #Translators
    [:agent, :call_centre, :customer, :purchase_manager, :category_buyer].each do |role|
      klass = "User::#{role.to_s.camelize}".constantize
      unless klass.find_by_email("translator_#{role}@nbs.com")
        if role == :category_buyer
          user = klass.make!(:email => "translator_#{role}@nbs.com", :password => "secret", :password_confirmation => "secret", :buying_categories => [Category.first])
        elsif role == :call_centre
          user = klass.make!(:email => "translator_#{role}@nbs.com", :password => "secret", :password_confirmation => "secret", :first_name => "Johnny", :last_name => "Mnemonic")
        else
          user = klass.make!(:email => "translator_#{role}@nbs.com", :password => "secret", :password_confirmation => "secret")
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
        'Terms & Conditions'
    ].each do |title|
      unless Article::Cms::MainPageArticle.includes(:translations).where(:article_translations => {:title => title}).first
        article = Article::Cms::MainPageArticle.make!(:title => title, :content => title, :key => title.parameterize('_'))
        [:en, :dk].each do |locale|
          I18n.locale = locale
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
        'blurb_buyer_home',
        'blurb_agent_home',
        'blurb_call_centre_home',
        'blurb_purchase_manager_home',
        'blurb_start_page_role_selection',
        'blurb_currencies',
        'blurb_category_home',
        'blurb_leads_listing',
        'blurb_agent_contact_us',
        'blurb_buyer_contact_us',
        'blurb_resend_confirmation',
        'blurb_certification_purchase_manager_signup',
        'blurb_certify_information'
    ].each do |key|
      unless Article::Cms::InterfaceContentText.where(:key => key).first
        article = Article::Cms::InterfaceContentText.make!(:title => key.humanize, :content => key.humanize, :key => key)
        [:en, :dk].each do |locale|
          I18n.locale = locale
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
        [:en, :dk].each do |locale|
          I18n.locale = locale
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
                                                :end_date => Date.today + 14.days})
    #inactive campaign
    Campaign.find_or_create_by_name({:name => "Testing Two",
                                     :category => Category.where(:name => "Electronics").first,
                                     :country => Country.where(:name => "United Kingdom").first,
                                     :max_contact_number => 3,
                                     :creator => call_centre,
                                     :start_date => Date.today - 15.days,
                                     :end_date => Date.today - 1.days})
    campaign.results = Result.generic_results
    campaign.users = call_centre.subaccounts

    [{:company_name => "Bon Jovi inc.", :company_phone_number => "888 112 113"},
     {:company_name => "Mleko company", :company_phone_number => "510 333 333"},
     {:company_name => "Stefanek corp", :company_phone_number => "888 422 633"},
     {:company_name => "PHU Sciemkata", :company_phone_number => "602 222 333"}].each do |attrs|
      Contact.find_or_create_by_company_name attrs.merge(:country => country, :campaign => campaign, :creator => call_centre, :category => category, :contact_name => "", :phone_number => "", :email_address => "", :creator_name => call_centre.full_name)
    end

    Contact.where("last_call_result_at IS NULL").each do |contact|
      last_call_result = contact.call_results.order("created_at DESC").first
      contact.update_attribute(:last_call_result_at, last_call_result.nil? ? nil : last_call_result.created_at)
    end

  end

  desc "recalculate_leads_average_ratings", ""

  def recalculate_leads_average_ratings
    CommonStats.recalculate_leads_average_ratings
  end

  desc "refresh_subaccounts_counters", ""

  def refresh_subaccounts_counters
    CommonStats.refresh_subaccounts_counters
  end

  desc "refresh_agent_counters", ""

  def refresh_agent_counters
    CommonStats.refresh_agent_counters
  end

  desc "refresh_buyer_counters", ""

  def refresh_buyer_counters
    CommonStats.refresh_buyer_counters
  end

  desc "refresh_exchange_rates", ""
  # updated daily between 2.15 p.m. and 3.00 p.m. CET
  def refresh_exchange_rates
    CurrencyConverter.cache_current_exchange_rates!
  end

  desc "copy yml to database", ""

  def t
    I18nUtils.populate!
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
end