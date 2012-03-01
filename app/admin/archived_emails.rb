ActiveAdmin.register ArchivedEmail, :as => "Archived Email" do

  index do
    column :id
    column :to
    column :subject
    column :status
    column :error_code
    column :created_at
    default_actions
  end

  show do |ae|
    attributes_table do
      row :id
      row :email_template_uniq_id
      row :to
      row :cc
      row :bcc
      row :reply_to
      row :sender
      row :subject
      row :body do
        raw ae.body
      end
      row :message_id
      row :error_code
      row :status
      row :related
      row :related_type
      row :body do
        raw ae.bounce_details
      end
      row :bounced_at
      row :created_at
      row :updated_at
    end
  end
  
end
