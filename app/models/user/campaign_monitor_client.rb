module User::CampaignMonitorClient

  def self.included(base)
    base.class_eval do
      after_save do
        cm_synchronize! if company_name_changed? or first_name_changed? or last_name_changed? or email_changed? or time_zone_changed?
      end
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    private

    def cm_delete!
      begin
        CreateSend::Client.new(with_role.cm_client_id).delete
        newsletter_lists.update_all("cm_list_id = NULL")
        with_role.update_attribute(:cm_client_id, nil)
      rescue Exception => e
        self.campaign_monitor_responses.create(:response => e)
        false
      end
    end

    def cm_create!
      client_id = CreateSend::Client.create((with_role.respond_to?(:company_name) ? with_role.company_name : with_role.full_name),
                                            with_role.full_name,
                                            with_role.email,
                                            CampaignMonitorTimezone.find(time_zone),
                                            with_role.country.name)
      with_role.update_attribute(:cm_client_id, client_id)
      client_id
    end

    def cm_update!
      CreateSend::Client.new(cm_client_id).set_basics((with_role.respond_to?(:company_name) ? with_role.company_name : with_role.full_name),
                                                      with_role.full_name,
                                                      with_role.email,
                                                      CampaignMonitorTimezone.find(time_zone),
                                                      with_role.country.name)
      cm_client_id
    end

    def cm_synchronize!
      begin
        cm_client_id.present? ? cm_update! : cm_create!
      rescue Exception => e
        self.campaign_monitor_responses.create(:response => e)
        false
      end
    end

    public

    def cm_client
      cm_client_id || cm_synchronize!
    end

  end
end