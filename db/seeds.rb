unless User.find_by_email("blazejek@gmail.com")
  puts "Creating default user..."
  u = User.create!(:email => "blazejek@gmail.com", :password => "secret", :password_confirmation => "secret")
  u.confirm!
  u.roles << :admin
  u.save
end

unless User.find_by_email("buyer@gmail2.com")
  u = User.create!(:email => "buyer@gmail2.com", :password => "secret", :password_confirmation => "secret")
  u.confirm!
  u.roles << :customer
  u.save
end

unless User.find_by_email("agent@gmail2.com")
  u = User.create!(:email => "agent@gmail2.com", :password => "secret", :password_confirmation => "secret")
  u.confirm!
  u.roles << :agent
  u.save
end

#Default settings
Settings.level_one_certification_threshold = 0
Settings.level_two_certification_threshold = 0
Settings.level_three_certification_threshold = 0
Settings.default_payout_delay = 0

Country.create(:name => "Poland")
Country.create(:name => "France")
