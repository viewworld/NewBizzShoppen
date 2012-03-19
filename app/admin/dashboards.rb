ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  section "Recent Emails" do
    table_for ArchivedEmail.order("id DESC").first(5).collect do
      column :subject do |email|
        link_to email.subject, administration_archived_email_path(email)
      end
      column :created_at
    end
    strong { link_to "View All Emails", administration_archived_emails_path }
  end

  section "Recent Paypal Responses" do
    table_for ArchivedPaypalResponse.order("id DESC").first(5).collect do
      column :response_type do |resp|
        link_to resp.response_type, administration_archived_paypal_response_path(resp)
      end
      column :has_errors
      column :created_at
    end
    strong { link_to "View All Paypal Responses", administration_archived_paypal_responses_path }
  end

  section "Awaiting Delayed Jobs" do
    table_for Delayed::Job.order("run_at DESC").first(5).collect do
      column :id do |dj|
        link_to dj.id, administration_delayed_job_path(dj)
      end
      column :queue do |dj|
        link_to dj.queue, administration_delayed_jobs_path(:q => {:queue_contains => dj.queue})
      end
      column :attempts
      column :run_at
    end
    strong { link_to "View All Delayed Jobs", administration_delayed_jobs_path }
  end

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
