class FeaturedDealObserver < ActiveRecord::Observer

  def after_save(featured_deal)
    if FeaturedDeal::POSITIONS.include?(featured_deal.position) and featured_deal.deal_id.nil?
      if backup = FeaturedDeal.where(:position => FeaturedDeal::BACKUP_POSITIONS).first
        featured_deal.update_attribute(:deal_id, backup.deal_id)
        backup.update_attribute(:deal_id, nil)
      end
    end
  end

end