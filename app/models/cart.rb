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

  def lead_purchases
    @buyer.lead_purchases_in_cart
  end

  def add_lead(lead)
    unless items.include?(lead)
      if currency_matches?(lead)
        if lead.buyable?
          if @buyer.purchase_limit_reached?(lead)
            return :big_buyer_purchase_limit_reached
          end
          purchase = @buyer.lead_single_purchases.create(:lead_id => lead.id, :paid => false, :purchased_by => @buyer.id)
          if @buyer.big_buyer?
            purchase.update_attribute(:accessible_from, Time.now)
            return :bought_successful
          else
            return :creation_successful
          end
        end
      else
        :currencies_mismatch
      end
    else
      :already_in_cart
    end
  end

  def buyout_lead(lead)
    if currency_matches?(lead)
      if @buyer.purchase_limit_reached?(lead, true)
        return :big_buyer_purchase_limit_reached
      end
      if lead.buyout_possible_for?(@buyer)
        lead.buyout!(@buyer)
      else
        :bought_by_other_user
      end
    else
      :currencies_mismatch
    end
  end

  def add_leads(*ids)
    Lead.where(:id => ids.flatten).map { |lead| add_lead(lead) }.select { |r| r != :already_in_cart and r != :currencies_mismatch and r != :big_buyer_purchase_limit_reached }
  end

  def remove_leads(*ids)
    @buyer.lead_purchases.in_cart.where(:lead_id => ids).destroy_all
  end

  def empty?
    count.zero?
  end

  def total
    BigDecimal.new(lead_purchases.sum('price * quantity'))
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

  def currency_name
    currency ? currency.name : ''
  end

  def currency_matches?(lead)
    unless empty?
      return currency == lead.currency
    end
    true
  end

  def fake_paypal_payment
    payment_notification = PaymentNotification.create!(
        :params => {
            :mc_gross => total,
            :receiver_email => APP_CONFIG[:paypal_email],
            :secret => APP_CONFIG[:paypal_secret]
          },
        :buyer_id => buyer.id,
        :status => "Completed",
        :transaction_id => rand(99999999).to_s)
    payment_notification.buyer.cart.paid!
  end

end