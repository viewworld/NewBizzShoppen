ActiveAdmin.register CampaignMonitorResponse, :as => "Campaign Monitor Responses" do

  index do
    column :id
    column :response
    column :resource do |cmr|
      "#{cmr.resource_type} ##{cmr.resource_id}"
    end
    default_actions
  end

  show do |cmr|
    attributes_table do
      row :id
      row :response
      row :resource do
        "#{cmr.resource_type} ##{cmr.resource_id}"
      end
      row :created_at
      row :updated_at
    end
  end
  
end
