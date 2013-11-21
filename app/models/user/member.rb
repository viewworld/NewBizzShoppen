class User::Member < ::User
  ROLES = [:member]
  CSV_ATTRS = %w{email first_name last_name company_name address_line_1 address_line_2 address_line_3 zip_code country region  phone vat_number}
  REQUIRED_FIELDS = %w{email first_name last_name company_name address_line_1 address_line_3 zip_code}

  attr_accessor :unsubscribe_and_close_account

  include User::RegistrationValidations
  include User::CommonAgent
  include Addresses
  include BankAccounts
  include User::CampaignMonitorClient

  validates_presence_of :company_name, :phone

  has_many :leads, :as => :creator

  public

  def unsubscribe_and_close_account!
    NewsletterListSubscriber.where(:subscriber_id => self.id).each do |nls|
      nls.destroy
    end

    lock_access!

    self
  end

  def can_publish_leads?
    false
  end

  def populate_fields_from_lead(lead)
    contact_name_arr = lead.contact_name.strip.split(" ")
    contact_name_arr = contact_name_arr.size == 1 ? contact_name_arr : [contact_name_arr.first, contact_name_arr[1..-1].join(' ')]
    lead_attrs = {:newsletter_on => true, :email => lead.email_address,
                  :phone => lead.direct_phone_number.blank? ? lead.phone_number : lead.direct_phone_number,
                  :first_name => contact_name_arr.first,
                  :last_name => contact_name_arr.last,
                  :time_zone => "UTC", :company_name => lead.company_name}
    self.attributes = lead_attrs
    [:address_line_1, :address_line_2, :address_line_3, :zip_code, :country_id, :region_id].each do |field|
      self.address.send("#{field}=".to_sym, lead.send(field))
    end
  end

  def comment_threads
    Comment.with_leads_created_by(self)
  end

  def requested_deals
    Deal.where("leads_leads.requested_by = ?", id).joins("INNER JOIN leads as leads_leads ON leads_leads.deal_id=leads.id")
  end

  def site
    :fairdeals
  end

########################################################################################################################
#
#   IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT
#
########################################################################################################################

  include AdvancedImport
  include AdvancedUserImport

  class << self



  end

########################################################################################################################

end
