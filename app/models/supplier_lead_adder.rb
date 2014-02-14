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
    @lead = processed_lead
  end

  def create_lead_purchase
    lead_purchase = LeadPurchase.create(lead_purchase_config)
    lead_purchase.update_attribute(:type, 'LeadSinglePurchase')
  end

  def lead_purchase_config
    {:accessible_from => Time.now,
     :lead => lead,
     :owner_id => current_user.id,
     :paid => true,
     :purchased_by => current_user.id,
     :without_notifications => true}
  end

  def lead_config
    {:country_id => current_user.with_role.country.id,
     :creator => lead_creator,
     :currency => Currency.default_currency,
     :price => 0,
     :published => true,
     :purchase_decision_date => Date.today,
     :purchase_value => 0,
     :sale_limit => 1}
  end

  def lead_creator
    User.find_by_email(Settings.default_lead_creator_email).with_role
  end
end
