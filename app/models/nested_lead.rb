class NestedLead
  attr_accessor :leads, :leads_attributes, :user

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def persisted?
    false
  end

  def initialize(params=nil)
    self.leads = []

    if params
      self.user = User::Member.find(params[:user_id])
      params[:nested_lead][:leads_attributes].each_pair do |key, attributes|
        lead = Lead.new(attributes.merge(:dont_send_email_with_deal_details_and_files => true))
        lead.based_on_deal(lead.deal, user)
        #if user.can_request?(lead.deal)
          self.leads << lead
        #end
      end
    end
  end

  def save
    if leads_valid?
      leads.each do |lead|
        lead.save
        user.decrement_free_deal_requests_in_free_period!
      end
      true
    else
      false
    end
  end

  def leads_valid?
    leads.select { |l| !l.valid? }.empty?
  end
end