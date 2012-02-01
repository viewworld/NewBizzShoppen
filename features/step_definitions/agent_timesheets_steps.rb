Given /^there are no cached timesheets$/ do
  `rm -rf ./public/system/agent_timesheets_cache/*`
end