require "spec/support/blueprints"

puts "Creating default categories..."
Category.find_or_create_by_name(:name => "Test category 1")
Category.find_or_create_by_name(:name => "Test category 2")

#Default settings
Settings.level_one_certification_threshold = 0
Settings.level_two_certification_threshold = 0
Settings.level_three_certification_threshold = 0
Settings.default_payout_delay = 0
Settings.default_leads_per_page = 5
Settings.default_news_per_page = 5
Settings.certification_level_1 = 10
Settings.certification_level_2 = 20

Country.find_or_create_by_name("Denmark")
Country.find_or_create_by_name("United Kingdom")

puts "Creating email templates..."
email_templates_array = [
  {:name => "confirmation instructions",
  :uniq_id => "confirmation_instructions",
  :en => {:subject => "Confirmation instructions",
               :body => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>" },
  :dk => {:subject => "[DK] Confirmation instructions",
               :body => "<p>Welcome {{user.email}}!</p><p>You can confirm your account through the link below:</p><p><a href=\"{{user.confirmation_instructions_url}}\">Confirm my account</a></p>" }
  },

  { :name => "reset_password_instructions",
    :uniq_id => "reset_password_instructions",
    :en => {:subject => "Reset password instructions",
            :body => "<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href=\"{{ user.reset_password_instructions_url }}\">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>"},
    :dk => {:subject => "[DK] Reset password instructions",
            :body => "<p>Hello {{ user.email }} !</p><p>Someone has requested a link to change your password, and you can do this through the link below.</p><p><a href=\"{{ user.reset_password_instructions_url }}\">Change my password</a></p><p>If you didn't request this, please ignore this email.</p><p>Your password won't change until you access the link above and create a new one.</p>"}
  },

{ :name => "Share leads by email message",
    :uniq_id => "share_leads_by_email_message",
    :en => {:subject => "Somebody shared leads with you",
            :body => "{% for lead in leads %}
<p>{{lead.id}}</p>
{% endfor %}"},
    :dk => {:subject => "[DK] Somebody shared leads with you",
            :body => "{% for lead in leads %}
<p>{{lead.id}}</p>
{% endfor %}"}
  },

{ :name => "Contact Lead by email message",
    :uniq_id => "contact_lead_by_email_message",
    :en => {:subject => "Contact regarding lead",
            :body => "<p>{{lead.id}}</p>"},
    :dk => {:subject => "[DK] Contact regarding lead",
            :body => "<p>{{lead.id}}</p>"}
  },

{ :name => "Lead Purchase is about to expire",
    :uniq_id => "lead_purchase_is_about_to_expire",
    :en => {:subject => "Lead Purchase is about to expire",
            :body => "<p>{{lead_purchase.id}}</p>"},
    :dk => {:subject => "[DK] Lead Purchase is about to expire",
            :body => "<p>{{lead_purchase.id}}</p>"}
  }
]

email_templates_array.each do |email_template|
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

puts "Creating default users..."
unless User::Admin.find_by_email("blazejek@gmail.com")
  u = User::Admin.make!(:email => "blazejek@gmail.com", :password => "secret", :password_confirmation => "secret", :screen_name => "admin1")
  u.confirm!
  u.save
end

unless User::Customer.find_by_email("buyer@gmail2.com")
  u = User::Customer.make!(:email => "buyer@gmail2.com", :password => "secret", :password_confirmation => "secret")
  u.confirm!
  u.save
end

unless User::Agent.find_by_email("agent@gmail2.com")
  u = User::Agent.make!(:email => "agent@gmail2.com", :password => "secret", :password_confirmation => "secret")
  u.confirm!
  u.save
end

unless User::LeadUser.find_by_email("leaduser@gmail2.com")
  u = User::LeadUser.make!(:email => "leaduser@gmail2.com", :password => "secret", :password_confirmation => "secret")
  u.confirm!
  u.save
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