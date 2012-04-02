module User::CampaignMonitorClient

  def self.included(base)
    base.class_eval do
      after_save do
        cm_synchronize! if newsletter_manager? and (newsletter_manager_changed? or company_name_changed? or first_name_changed? or last_name_changed? or email_changed? or time_zone_changed?)
        cm_set_access! if newsletter_manager? and newsletter_manager_changed?
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
      begin
        client_id = CreateSend::Client.create((with_role.respond_to?(:company_name) ? with_role.company_name : with_role.full_name),
                                              with_role.full_name,
                                              with_role.email,
                                              CampaignMonitorTimezone.find(time_zone),
                                              with_role.country.name)
        with_role.update_attribute(:cm_client_id, client_id)
        client_id
      rescue Exception => e
        self.campaign_monitor_responses.create(:response => e)
        false
      end
    end

    def cm_update!
      begin
        CreateSend::Client.new(cm_client_id).set_basics((with_role.respond_to?(:company_name) ? with_role.company_name : with_role.full_name),
                                                        with_role.full_name,
                                                        with_role.email,
                                                        CampaignMonitorTimezone.find(time_zone),
                                                        with_role.country.name)
        cm_client_id
      rescue Exception => e
        self.campaign_monitor_responses.create(:response => e)
        false
      end
    end
    
    def cm_exists?
      begin
        CreateSend::Client.new(cm_client_id).details.ClientID == cm_client_id
      rescue Exception => e
        self.campaign_monitor_responses.create(:response => e)
        false
      end
    end    

    def cm_set_access!
      begin
        random_username = cm_username.present? ? cm_username : generate_cm_username
        random_password = cm_password.present? ? cm_password : generate_token(7)
        CreateSend::Client.new(with_role.cm_client_id).set_access(random_username, random_password, 63)
        CreateSend::Client.new(with_role.cm_client_id).set_payg_billing("EUR", true, true, 2000)
        with_role.update_attributes(:cm_username => random_username, :cm_password => random_password)
      rescue Exception => e
        self.campaign_monitor_responses.create(:response => e)
        false
      end
    end

    def generate_cm_username
      "#{company_name.present? ? company_name : full_name} #{id}".to_url.gsub("-", "_")
    end

    def cm_synchronize!
      cm_exists? ? cm_update! : cm_create!
    end

    public

    def cm_client
      cm_exists? ? cm_client_id : cm_create!
    end

  end
end