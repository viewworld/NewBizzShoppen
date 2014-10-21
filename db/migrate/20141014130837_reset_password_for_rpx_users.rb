class ResetPasswordForRpxUsers < ActiveRecord::Migration
  def up
    client_emails = ['prabhutie@gmail.com', 'tathagat@appinonline.com', 'andersschneider@msn.com', 'tathagata.mukherji@gmail.com']
    User.where(email: client_emails).each do |user|
      user.send_reset_password_instructions
    end
  end

  def down
  end
end
