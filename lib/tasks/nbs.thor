class Nbs < Thor
  require File.expand_path('config/environment.rb')

  desc "seed", ""

  def seed
    puts "running seed"

    require "spec/support/blueprints"
#Default settings
    Settings.default_payout_delay   = 0
    Settings.default_leads_per_page = 5
    Settings.certification_level_1  = 10
    Settings.certification_level_2  = 20
    Settings.contact_us_email = "contact@nbs.fake.com"

    Country.find_or_create_by_name("Denmark")
    Country.find_or_create_by_name("United Kingdom")

    email_templates_array = [
        {:name    => "confirmation instructions",
         :uniq_id => "confirmation_instructions",
         :en      => {:subject => "Confirmation instructions",
                      :body    => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>"},
         :dk      => {:subject => "[DK] Confirmation instructions",
                      :body    => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>"}
        },

        {:name    => "reset_password_instructions",
         :uniq_id => "reset_password_instructions",
         :en      => {:subject => "Reset password instructions",
                      :body    => "<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href=\"{{ user.reset_password_instructions_url }}\">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>"},
         :dk      => {:subject => "[DK] Reset password instructions",
                      :body    => "<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href=\"{{ user.reset_password_instructions_url }}\">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>"}
        },

        {:name    => "Share leads by email message",
         :uniq_id => "share_leads_by_email_message",
         :en      => {:subject => "Somebody shared leads with you",
                      :body    => "{% for lead in leads %}
<p>{{lead.id}}</p>
{% endfor %}"},
         :dk      => {:subject => "[DK] Somebody shared leads with you",
                      :body    => "{% for lead in leads %}
<p>{{lead.id}}</p>
{% endfor %}"}
        },

        {:name    => "Contact Lead by email message",
         :uniq_id => "contact_lead_by_email_message",
         :en      => {:subject => "Contact regarding lead",
                      :body    => "<p>{{lead.id}}</p>"},
         :dk      => {:subject => "[DK] Contact regarding lead",
                      :body    => "<p>{{lead.id}}</p>"}
        },

        {:name    => "Lead Purchase is about to expire",
         :uniq_id => "lead_purchase_is_about_to_expire",
         :en      => {:subject => "Lead Purchase is about to expire",
                      :body    => "<p>{{lead_purchase.id}}</p>"},
         :dk      => {:subject => "[DK] Lead Purchase is about to expire",
                      :body    => "<p>{{lead_purchase.id}}</p>"}
        },

        {:name    => "Lead rated as unsatisfactory",
         :uniq_id => "lead_rated_as_unsatisfactory",
         :en      => {:subject => "Lead has been rated as unsatisfactory",
                      :body    => "<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>"},
         :dk      => {:subject => "[DK] Lead has been rated as unsatisfactory",
                      :body    => "<p>Lead {{lead_purchase.header}} has been rated as {{lead_purchase.rating_level_as_text}} with the following reason: {{lead_purchase.rating_reason}}.</p>"}
        },

        { :name => "Notify buyers about lead update",
            :uniq_id => "notify_buyers_about_lead_update",
            :en => {:subject => "Lead has been updated",
                    :body => "<p>Lead {{lead.header}} has been updated by agent.</p>"},
            :dk => {:subject => "[DK] Lead has been updated",
                    :body => "<p>Lead {{lead.header}} has been updated by agent.</p>"}
          },

        { :name => "Contact us",
            :uniq_id => "contact_us",
          :en => {:subject => "Question",
                  :body => "<p></p>"},
          :dk => {:subject => "[DK] Question",
                  :body => "<p></p>"}
        }
    ]

    email_templates_array.each do |email_template|
      unless EmailTemplate.find_by_uniq_id(email_template[:uniq_id])
        [:en, :dk].each do |locale|
          I18n.locale = locale
          et          = EmailTemplate.find_or_initialize_by_uniq_id({:name    => email_template[:name], :persist => true,
                                                                     :from    => "noreply@newbizzshoppen.com",
                                                                     :uniq_id => email_template[:uniq_id]})
          et.body     = email_template[locale][:body]
          et.subject  = email_template[locale][:subject]
          et.save!
        end
      end

    end

    unless User::Admin.find_by_email("blazejek@gmail.com")
      u = User::Admin.make!(:email => "blazejek@gmail.com", :password => "secret", :password_confirmation => "secret", :screen_name => "root")
      u.confirm!
      u.save
    end


    unless Rails.env.production?

      if Category.count.zero?
        Category.make!(:name => "Electronics")
        Category.make!(:name => "Leisure")
        Category.make!(:name => "Business")
      end

      unless User::Agent.find_by_email("agent@nbs.com")
        u = User::Agent.make!(:email => "agent@nbs.com", :password => "secret", :password_confirmation => "secret")
        u.confirm!
        u.save
      end

      if Lead.count.zero?
        agent = User::Agent.find_by_email("agent@nbs.com")
        ["Big deal on printers", "Drills required", "Need assistance in selling a car", "Ipod shipment", "Trip to amazonia - looking for offer", "LCD - Huge amounts", "GPS receivers required"].each do |header|
          Lead.make!(:category_id => Category.last.id, :header => header, :creator_id => agent.id)
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
      user  = User::LeadUser.find_by_email("leaduser@nbs.com")


      unless buyer.subaccounts.include?(user)
        buyer.subaccounts << user
      end

    end

    puts "Creating default main page articles..."
    ['About us','Privacy','Terms & Conditions'].each do |title|
      unless Article::Cms.main_page_articles.includes(:translations).where(:article_translations => {:title => title}).first
        article = Article::Cms.make!(:scope => Article::Cms::MAIN_PAGE_ARTICLE, :title => title, :content => title, :key => title.parameterize('_'))
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
    ['blurb_sign_up','blurb_buyer_home','blurb_agent_home','blurb_start_page_role_selection'].each do |key|
      unless Article::Cms.interface_content_texts.where(:key => key).first
        article = Article::Cms.make!(:scope => Article::Cms::INTERFACE_CONTENT_TEXT, :title => key.humanize, :content => key.humanize, :key => key)
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
    ['reset_password'].each do |key|
      unless Article::Cms.help_popups.where(:key => key).first
        article = Article::Cms.make!(:scope => Article::Cms::HELP_POPUP, :title => key.humanize, :content => key.humanize, :key => key)
        [:en, :dk].each do |locale|
          I18n.locale = locale
          article.title = key.humanize
          article.content = key.humanize
          article.save
          article.publish!
        end
      end
    end

  end

  desc "recalculate_leads_average_ratings", ""

  def recalculate_leads_average_ratings
    Lead.all(:conditions => ["published = ? and users.locked_at is NULL", true], :joins => "INNER JOIN users ON users.id=leads.creator_id", :readonly => false).each do |lead|
      lead.calculate_average_rating
      lead.save
    end
  end
end