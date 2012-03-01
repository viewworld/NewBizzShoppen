ActiveAdmin.register ArchivedPaypalResponse, :as => "Archived Paypal Response" do

  index do
    column :id
    column :user_id
    column :subscription_type
    column :subscription_id
    column :response_type
    column :has_errors
    column :created_at
    default_actions
  end

  show do |resp|
    attributes_table do
      row :id
      row :user_id
      row :subscription do
        resp.subscription.name
      end
      row :subscription_type
      row :has_errors
      row :response_details do
        raw resp.response_details.to_yaml.gsub("\n",'<br/>')
      end
      row :created_at
      row :updated_at
    end
  end

end
