class DealSweeper < ActionController::Caching::Sweeper
  observe Deal

  def after_create(deal)
    expire_cache_for(deal)
  end

  def after_update(deal)
    expire_cache_for(deal)
  end

  def after_destroy(deal)
    expire_cache_for(deal)
  end

  def expire_cache_for(deal)
    expire_fragment(/deal_#{deal.id}/)
  end
end