class LeadObserver < ActiveRecord::Observer

  def after_create(lead)
    Category.find(lead.category_id).send(:refresh_leads_count_cache!)
  end

  def after_destroy(lead)
    Category.find(lead.category_id).send(:refresh_leads_count_cache!)
  end

  def after_update(lead)
    if lead.changes["category_id"]
      Category.find(lead.changes["category_id"]).each { |c| c.send(:refresh_leads_count_cache!) }
    end
  end
end