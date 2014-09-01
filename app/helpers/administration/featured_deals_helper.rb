module Administration::FeaturedDealsHelper
  def currently_selected_deal(position)
    FeaturedDeal.find_by_position(position).deal_id
  end
end
