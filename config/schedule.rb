# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

dir_pwd = Dir.pwd.gsub(/(releases\/\d+)/, "current")

set :output, File.join(dir_pwd, "log/cron_log.log")

hours = %w{1 1 2 2 3 3 5}
['recalculate_leads_average_ratings', 'refresh_subaccounts_counters', 'refresh_agent_counters', 'refresh_supplier_counters', 'check_lead_certification_requests'].each_with_index do |thor_task, i|
  every 1.day, :at => "#{hours[i]}:#{i % 2 == 0 ? '00' : '30' } am" do
    command File.join(dir_pwd, "RAILS_ENV=production thor nbs:#{thor_task}")
  end
end

every 1.day, :at => "4:00 am" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:refresh_exchange_rates")
end

every 1.day, :at => "8:00 pm" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:send_daily_lead_notifications")
end

every :sunday, :at => "8:00 pm" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:send_daily_lead_notifications")
end

every 1.day, :at => "0:00" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:prolong_subscriptions_daily")
end

every 1.day, :at => "1:00 am" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:create_unpaid_invoices_for_unpaid_sub_periods")
end

every 8.hours do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:synchronize_newsletter_lists")
end

every 1.day, :at => "2:00" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:merge_regular_user_session_logs")
end

every 1.day, :at => "6:00 am" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:import_contacts_from_newsletter_lists")
endend

every 1.day, :at => "6:00 am" do
  command File.join(dir_pwd, "RAILS_ENV=production thor nbs:import_contacts_from_newsletter_lists")
end