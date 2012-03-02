class LeadObserver < ActiveRecord::Observer

  def after_create(lead)
    Category.find(lead.category_id).send(:refresh_leads_count_cache!)
    Category.find(lead.category_id).send(:refresh_published_leads_count_cache!)
  end

  def after_destroy(lead)
    Category.find(lead.category_id).send(:refresh_leads_count_cache!)
    Category.find(lead.category_id).send(:refresh_published_leads_count_cache!)
  end

  def after_update(lead)
    if lead.changes["category_id"]
      Category.where(:id => lead.changes["category_id"]).each do |c|
        c.send(:refresh_leads_count_cache!)
        c.send(:refresh_published_leads_count_cache!)
      end
    elsif lead.changes["published"]
      lead.category.send(:refresh_published_leads_count_cache!)
    end
  end
end