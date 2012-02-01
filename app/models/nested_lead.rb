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
        lead = Lead.new(attributes)
        lead.based_on_deal(lead.deal, user)
        self.leads << lead
      end
    end
  end

  def save
    if leads_valid?
      leads.each(&:save)
      true
    else
      false
    end
  end

  def leads_valid?
    leads.select { |l| !l.valid? }.empty?
  end
end