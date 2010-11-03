require "spec/support/blueprints"

Category.create(:name => "Test category 1")
Category.create(:name => "Test category 2")

#Default settings
Settings.level_one_certification_threshold = 0
Settings.level_two_certification_threshold = 0
Settings.level_three_certification_threshold = 0
Settings.default_payout_delay = 0
Settings.default_leads_per_page = 5


Country.find_or_create_by_name("Denmark")
Country.find_or_create_by_name("United Kingdom")

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
  }]

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

unless User::Admin.find_by_email("blazejek@gmail.com")
  puts "Creating default user..."
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