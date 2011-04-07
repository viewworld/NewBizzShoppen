# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, File.join(Dir.pwd, "log/cron_log.log")

hours = %w{1 1 2 2 3 3}
['recalculate_leads_average_ratings', 'refresh_subaccounts_counters', 'refresh_agent_counters', 'refresh_buyer_counters'].each_with_index do |thor_task, i|
  every 1.day, :at => "#{hours[i]}:#{i % 2 == 0 ? '00' : '30' } am" do
    command File.join(Dir.pwd, "RAILS_ENV=production thor nbs:#{thor_task}")
  end
end


