class ActiveRecord::Relation
  def dismiss_all
    to_a.each{|obj| obj.update_attribute(:dismissed_at, Time.zone.now)}
  end
end