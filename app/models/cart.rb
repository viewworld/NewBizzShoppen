class Cart
  include CartPaypalPayment

  attr_accessor :supplier

  def initialize(supplier)
    raise "Invalid supplier object: #{supplier.to_yaml}" unless supplier.kind_of?(User::LeadSupplier)
    @supplier=supplier
  end

  def items
    @supplier.leads_in_cart
  end

  def lead_purchases
    @supplier.lead_purchases_in_cart
  end

  def add_lead(lead)
    unless items.include?(lead)
      if currency_matches?(lead)
        if lead.buyable?
          if @supplier.purchase_limit_reached?(lead)
            return :big_supplier_purchase_limit_reached
          end
          purchase = @supplier.lead_single_purchases.create(:lead_id => lead.id, :paid => false, :purchased_by => @supplier.id)
          if @supplier.big_buyer?
            purchase.update_attribute(:accessible_from, Time.now)
            return :bought_successful
          else
            return :creation_successful
          end
        else
          :cannot_be_bought
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
      if @supplier.purchase_limit_reached?(lead, true)
        return :big_supplier_purchase_limit_reached
      end
      if lead.buyout_possible_for?(@supplier)
        lead.buyout!(@supplier)
      else
        :bought_by_other_user
      end
    else
      :currencies_mismatch
    end
  end

  def add_leads(*ids)
    Lead.where(:id => ids.flatten).map { |lead| add_lead(lead) }.select { |r| r != :already_in_cart and r != :currencies_mismatch and r != :big_supplier_purchase_limit_reached }
  end

  def remove_leads(*ids)
    @supplier.lead_purchases.in_cart.where(:lead_id => ids).destroy_all
  end

  def empty?
    count.zero?
  end

  def total
    BigDecimal.new(lead_purchases.sum('price * quantity')) + total_vat_value
  end

  def total_netto
    BigDecimal.new(lead_purchases.sum('price * quantity'))
  end

  def count
    items.count
  end

  def empty!
    @supplier.lead_purchases.in_cart.destroy_all
  end

  def paid!
    supplier.lead_purchases.in_cart.each { |lp| lp.send(:paid!) }
  end

  def id
    Time.now.strftime("%y%m%d%S") + @supplier.id.to_s
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
    payment_notification = PaypalCartPaymentNotification.create!(
        :params => {
            :mc_gross => total,
            :receiver_email => APP_CONFIG[:paypal_email],
            :secret => APP_CONFIG[:paypal_secret]
          },
        :buyer_id => supplier.id,
        :status => "Completed",
        :transaction_id => rand(99999999).to_s)
    payment_notification.supplier.cart.paid!
  end

  def total_vat_value
    vat_value = BigDecimal.new("0.0")
    unless @supplier.not_charge_vat?
      vat_rate = @supplier.country_vat_rate
      items.each do |item|
        vat_value += (item.price * BigDecimal(vat_rate.to_s).div(100,4)).round(2)
      end
    end
    vat_value
  end

end