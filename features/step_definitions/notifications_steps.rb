Then /^notification for user "([^"]*)" should be created$/ do |email|
  User.where(:email => email).first.with_role.notifications.count.should == 1
end

Then /^the last notification should be active$/ do
  Notification.last.notify_at.should < Time.now
end

Then /^the last notification should not be active$/ do
  Notification.last.notify_at.should > Time.now
end

Given /^there is pending notification for user "([^"]*)"$/ do |email|
  User.where(:email => email).first.with_role.notifications.create!(
      :title => "Notification title",
      :text => "Notification text",
      :notify_at => Time.now-1.day)
end

Then /^last notification for user "([^"]*)" should be dismissed$/ do |email|
  User.where(:email => email).first.with_role.notifications.last.dismissed_at.should_not be_nil
end

Given /^there is pending notification with my profile link for user "([^"]*)"$/ do |email|
  User.where(:email => email).first.with_role.notifications.create!(
      :title => "Notification title",
      :text => "<a href='/my_profile'>Profile link</a>",
      :notify_at => Time.now-1.day)
end

