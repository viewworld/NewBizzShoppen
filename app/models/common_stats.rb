class CommonStats

  def self.recalculate_leads_average_ratings
    Lead.all(:conditions => ["published = ? and users.locked_at is NULL", true], :joins => "INNER JOIN users ON users.id=leads.creator_id", :readonly => false).each do |lead|
      lead.notify_buyers_after_update = false
      lead.calculate_average_rating
      lead.refresh_hotness_counter
      lead.save
    end
  end

  def self.refresh_subaccounts_counters
    User::Abstract.where("parent_id is not null").each do |user|
      user.refresh_subaccounts_counters!
    end
  end

  def self.refresh_agent_counters
    User::CallCentre.all.each do |user|
      user.refresh_call_centre_counters!
    end

    (User::Agent.all + User::CallCentreAgent.all).each do |user|
      user.refresh_agent_counters!
    end
  end

  def self.refresh_buyer_counters
    User::LeadBuyer.all.each do |user|
      user.refresh_buyer_counters!
    end
  end
end