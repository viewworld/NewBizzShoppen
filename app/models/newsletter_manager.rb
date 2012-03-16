class NewsletterManager

  def self.current_update_newsletter_objects_job
    Delayed::Job.where(:queue => "newsletter_objects_update").first
  end

  def self.create_new_update_newsletter_objects_job
    unless NewsletterManager.current_update_newsletter_objects_job
      NewsletterManager.new.delay(:queue => "newsletter_objects_update", :run_at => Time.now + 5.minutes).update_all_subscribable_objects!(Time.now)
    end
  end

  def update_all_subscribable_objects!(now)
    (Contact.joins(:newsletter_subscriber).where("leads.updated_at BETWEEN ? AND ?", now-10.seconds, Time.now) +
    User.joins(%{INNER JOIN "newsletter_subscribers" ON "newsletter_subscribers"."subscribable_id" = "users"."id" AND ("newsletter_subscribers"."subscribable_type" like 'User::%' OR "newsletter_subscribers"."subscribable_type" like 'SubscriptionPlan')}).where("users.updated_at BETWEEN ? AND ?", now-10.seconds, Time.now) +
    Lead.joins(:newsletter_subscriber).where("leads.updated_at BETWEEN ? AND ?", now-10.seconds, Time.now)).each do |sob|
      puts "<#{sob.class.to_s} ##{sob.id}>"
      sob = sob.with_role if sob.class.to_s == "User"
      sob.send(:update_newsletter_subscriber)
    end
  end
end