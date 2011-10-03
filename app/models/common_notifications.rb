class CommonNotifications

  def self.send_daily_lead_notifications!
    User.with_suppliers.where("lead_notification_type = ?", User::LEAD_NOTIFICATION_ONCE_PER_DAY).each { |u| u.deliver_lead_notification }
  end

  def self.send_weekly_lead_notifications!
    User.with_suppliers.where("lead_notification_type = ?", User::LEAD_NOTIFICATION_ONCE_PER_WEEK).each { |u| u.deliver_lead_notification }
  end
end