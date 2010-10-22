class Cart
  attr_accessor :buyer

  def initialize(buyer)
    raise "Invalid buyer object: #{buyer.to_yaml}" unless buyer.kind_of?(User::LeadBuyer)
    @buyer=buyer
  end

  def items
    @buyer.leads_in_cart
  end

  def add_lead(lead)
    lead.buyable? && @buyer.lead_purchases.create(:lead_id => lead.id, :paid => false)
  end

  def remove_lead(*ids)
    @buyer.lead_purchases.in_cart.where(:lead_id => ids).destroy_all
  end

  def empty?
    count.zero?
  end

  def total
    items.sum('price')
  end

  def count
    items.count
  end

  def empty!
    @buyer.lead_purchases.in_cart.destroy_all
  end
end