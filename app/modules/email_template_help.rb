module EmailTemplateHelp

  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  HELP = {
      "confirmation_instructions" => [User],
      "reset_password_instructions" => [User],
      "share_leads_by_email_message" => [Lead],
      "contact_lead_by_email_message" => [Lead],
      "lead_purchase_is_about_to_expire" => [LeadPurchase],

      "lead_rated_as_unsatisfactory" => [LeadPurchase],
      "notify_buyers_about_lead_update" => [Lead],
      "contact_us" => [],
      "invoice" => [],
      "category_request" => ["request_type", "category_name", "lead_description", "leads_count_per_month", "can_be_contacted"],

      "more_leads_request" => ["category_name", "company_name", "contact_name", "contact_email", "contact_phone", "note"],
      "certification_request" => [LeadCertificationRequest],
      "bought_lead_notification" => [LeadPurchase],
      "certification_request_reminder" => [LeadCertificationRequest],
      "lead_notification_instant" => [Lead],

      "lead_notification_daily" => [Lead],
      "lead_notification_weekly" => [Lead],
      "result_send_material" => [],
      "upgrade_contact_to_category_buyer" => [User, "password"],
      "upgrade_contact_to_buyer" => [User, "password"],

      "upgrade_contact_to_member" => [User, "password"],
      "upgraded_contact_to_category_buyer_welcome" => [User],
      "upgraded_contact_to_buyer_welcome" => [User],
      "upgraded_contact_to_member_welcome" => [User],
      "deal_certification_request" => [DealCertificationRequest],

      "deal_certification_buyer_welcome" => [User, "password"],
      "share_deal_by_email" => ["description", "deal_url", "name"],
      "blank_template" => ["body_content"],
      "member_invitation" => [User, "new_password"],
      "supplier_invitation" => [User, "new_password"],

      "deal_request_details" => [Deal],
      "deal_request_for_deal_admin" => ["name", "phone_number", "email_from", "deal_description"]
  }

  module InstanceMethods

    def available_variables
      result = []
      EmailTemplateHelp::HELP[uniq_id].each do |item|
        if item.class == String
          result << "{{#{item}}}"
        else
          keys = if item == Lead
                   Lead::LIQUID_METHODS.call(self).keys - ["fine_print"]
                 elsif item == Deal
                   Deal::LIQUID_METHODS.call(self).keys - ["show_lead_details_url"]
                 else
                   "#{item.to_s}::LIQUID_METHODS".constantize.call(self).keys
                 end
          keys.each { |liquid_method| result << "{{#{item.to_s.underscore}.#{liquid_method}}}" }
        end
      end
      result.sort
    end

  end
end