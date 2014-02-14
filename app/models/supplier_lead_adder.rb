class SupplierLeadAdder
  attr_accessor :lead
  attr_reader :current_user
  private :current_user

  def initialize(lead, current_user)
    @current_user = current_user
    @lead = lead
  end

  def process
    result = lead_with_default_values.save
    create_lead_purchase if result
    result
  end

  private

  def lead_with_default_values
    processed_lead = lead
    processed_lead.attributes = lead_config
    self.lead = processed_lead
  end


  def create_lead_purchase
    lead_purchase = LeadPurchase.create(lead_purchase_config)
    lead_purchase.update_attribute(:type, 'LeadSinglePurchase')
  end

  def lead_purchase_config
    {:lead => lead,
     :owner_id => current_user.id,
     :paid => true,
     :accessible_from => Time.now,
     :purchased_by => current_user.id,
     :without_notifications => true}
  end

  def lead_config
    {:creator => lead_creator,
     :country_id => current_user.with_role.country.id,
     :purchase_value => 0,
     :price => 0,
     :currency => Currency.default_currency,
     :sale_limit => 1,
     :purchase_decision_date => Date.today,
     :published => true}
  end

  def lead_creator
    User.find_by_email(Settings.default_lead_creator_email).with_role
  end
end

