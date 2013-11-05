namespace :nbs do
  namespace :dev do

    desc "Change all users password to secret (DEV)"
    task :secretize_password_for_all_users => :environment do
      if Rails.env.development?
        user =  User::Admin.first
        user.send :secretize_password!

        result = User.update_all(:encrypted_password => user.encrypted_password, :password_salt => user.password_salt)

        puts "Updated users: #{result}"
      else
        "You're not in DEV mode"
      end
    end

  end
end


