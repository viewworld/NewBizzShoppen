unless User.find_by_email("blazejek@gmail.com")
  puts "Creating default user..."
  u = User.create!(:email => "blazejek@gmail.com", :password => "secret", :password_confirmation => "secret")
  u.confirm!
  u.roles << :admin
  u.save
end