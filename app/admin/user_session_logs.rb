ActiveAdmin.register UserSessionLog, :as => "User Session Logs" do

  index do
    column :id
    column :user_id
    column :campaign_id
    column :start_time
    column :end_time
    column :hours_count
    column :end_date
    column :log_type
    column :euro_billing_rate
    column :created_at
    column :updated_at
    default_actions
  end

  #show do |dj|
  #  attributes_table do
  #    row :id
  #    row :queue
  #    row :priority
  #    row :attempts
  #    row :last_error
  #    row :failed_at
  #    row :run_at
  #    row :locked_at
  #    row :locked_by
  #    row :created_at
  #    row :updated_at
  #    row :handler do
  #      raw dj.handler.gsub("\n",'<br/>')
  #    end
  #  end
  #end

end
