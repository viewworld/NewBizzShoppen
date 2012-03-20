ActiveAdmin.register Delayed::Job, :as => "Delayed Jobs" do

  index do
    column :id
    column :queue
    column :priority
    column :attempts
    column :run_at
    column :created_at
    default_actions
  end

  show do |dj|
    attributes_table do
      row :id
      row :queue
      row :priority
      row :attempts
      row :last_error
      row :failed_at
      row :run_at
      row :locked_at
      row :locked_by
      row :created_at
      row :updated_at
      row :handler do
        raw dj.handler.gsub("\n",'<br/>')
      end
    end
  end
  
end
