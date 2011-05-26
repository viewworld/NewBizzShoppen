class User::PurchaseManager < ::User
  ROLES = [:purchase_manager]

  include User::RegistrationValidations
  include User::CommonAgent
  include Addresses
  include BankAccounts

  def can_publish_leads?
    false
  end

  def populate_fields_from_lead(lead)
    contact_name_arr = lead.contact_name.strip.split(" ")
    contact_name_arr = contact_name_arr.size == 1 ? contact_name_arr : [contact_name_arr.first, contact_name_arr[1..-1]]
    lead_attrs = {:newsletter_on => true, :email => lead.email_address,
                  :phone => lead.direct_phone_number.blank? ? lead.phone_number : lead.direct_phone_number,
                  :first_name => contact_name_arr.first,
                  :last_name => contact_name_arr.last,
                  :screen_name => "#{lead.contact_name}#{' ' unless lead.contact_name.blank?}(#{lead.email_address})"}
    self.attributes = lead_attrs
    [:address_line_1, :address_line_2, :address_line_3, :zip_code, :country_id, :region_id].each do |field|
      self.address.send("#{field}=".to_sym, lead.send(field))
    end
  end
end