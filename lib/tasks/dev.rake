namespace :nbs do
  namespace :dev do

    desc "Change all users password to secret (DEV)"
    task :secretize_password_for_all_users => :environment do
      if Rails.env.development?
        User.secretize_passwords!
      else
        "You're not in DEV mode"
      end
    end

  end
end


