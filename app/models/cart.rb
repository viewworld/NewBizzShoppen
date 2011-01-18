class Cart
  include PaypalPayment

  attr_accessor :buyer

  def initialize(buyer)
    raise "Invalid buyer object: #{buyer.to_yaml}" unless buyer.kind_of?(User::LeadBuyer)
    @buyer=buyer
  end

  def items
    @buyer.leads_in_cart
  end

  def add_lead(lead)
    unless items.include?(lead)
      if lead.buyable?
        purchase = @buyer.lead_purchases.create(:lead_id => lead.id, :paid => false)
        if @buyer.big_buyer?
          purchase.update_attribute(:accessible_from, Time.now)
          return :bought_successful
        else
          return :creation_successful
        end
      end
    else
      :already_in_cart
    end
  end

  def add_leads(*ids)
    Lead.where(:id => ids.flatten).map { |lead| add_lead(lead) }.select { |r| r != :already_in_cart }
  end

  def remove_leads(*ids)
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

  def paid!
    buyer.lead_purchases.in_cart.each { |lp| lp.send(:paid!) }
  end

  def id
    Time.now.strftime("%y%m%d%S") + @buyer.id.to_s
  end

  def currency
    items.any? ? items.first.currency : nil
  end

end