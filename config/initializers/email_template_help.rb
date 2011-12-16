module EmailTemplateHelp

  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  HELP = {
      "confirmation_instructions" => {:classes => ["User"], :custom => []},
      "reset_password_instructions" => {:classes => ["User"], :custom => []},
      "share_leads_by_email_message" => {:classes => ["Lead"], :custom => []},
      "contact_lead_by_email_message" => {:classes => ["Lead"], :custom => []},
      "lead_purchase_is_about_to_expire" => {:classes => ["LeadPurchase"], :custom => []},

      "lead_rated_as_unsatisfactory" => {:classes => ["LeadPurchase"], :custom => []},
      "notify_buyers_about_lead_update" => {:classes => ["Lead"], :custom => []},
      "contact_us" => {:classes => [], :custom => []},
      "invoice" => {:classes => [], :custom => []},
      "category_request" => {:classes => [], :custom => ["request_type", "category_name", "lead_description", "leads_count_per_month", "can_be_contacted"]},

      "more_leads_request" => {:classes => [], :custom => ["category_name", "company_name", "contact_name", "contact_email", "contact_phone", "note"]},
      "certification_request" => {:classes => ["LeadCertificationRequest"], :custom => []},
      "bought_lead_notification" => {:classes => ["LeadPurchase"], :custom => []},
      "certification_request_reminder" => {:classes => ["LeadCertificationRequest"], :custom => []},
      "lead_notification_instant" => {:classes => ["Lead"], :custom => []},

      "lead_notification_daily" => {:classes => ["Lead"], :custom => []},
      "lead_notification_weekly" => {:classes => ["Lead"], :custom => []},
      "result_send_material" => {:classes => [], :custom => []},
      "upgrade_contact_to_category_buyer" => {:classes => ["User"], :custom => ["password"]},
      "upgrade_contact_to_buyer" => {:classes => ["User"], :custom => ["password"]},

      "upgrade_contact_to_member" => {:classes => ["User"], :custom => ["password"]},
      "upgraded_contact_to_category_buyer_welcome" => {:classes => ["User"], :custom => []},
      "upgraded_contact_to_buyer_welcome" => {:classes => ["User"], :custom => []},
      "upgraded_contact_to_member_welcome" => {:classes => ["User"], :custom => []},
      "deal_certification_request" => {:classes => ["DealCertificationRequest"], :custom => []},

      "deal_certification_buyer_welcome" => {:classes => ["User"], :custom => ["password"]},
      "share_deal_by_email" => {:classes => [], :custom => ["description", "deal_url", "name"]},
      "blank_template" => {:classes => [], :custom => ["body_content"]},
      "member_invitation" => {:classes => ["User"], :custom => ["new_password"]},
      "supplier_invitation" => {:classes => ["User"], :custom => ["new_password"]},

      "deal_request_details" => {:classes => ["Deal"], :custom => []},
      "deal_request_for_deal_admin" => {:classes => [], :custom => ["name", "phone_number", "email_from", "deal_description"] }
  }

  module InstanceMethods

    def available_variables
      result = []
      hash = EmailTemplateHelp::HELP[uniq_id]
      hash[:custom].each do |item|
        result << "{{#{item}}}"
      end

      hash[:classes].each do |item|
        keys = if item.to_s == "Lead"
                 Lead::LIQUID_METHODS.call(self).keys - ["fine_print"]
               elsif item.to_s == "Deal"
                 Deal::LIQUID_METHODS.call(self).keys - ["show_lead_details_url"]
               else
                 "#{item.to_s}::LIQUID_METHODS".constantize.call(self).keys
               end
        keys.each { |liquid_method| result << "{{#{item.to_s.underscore}.#{liquid_method}}}" }
      end

      result.sort
    end

  end
end