When /^comment for lead "([^"]*)" was posted by user "([^"]*)" with attributes "([^"]*)"$/ do |lead_header, email, options|
  lead = Lead.find_by_header(lead_header).first
  user = User.find_by_email(email).with_role
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  Comment.make!({:commentable_id => lead.id, :commentable_type => "AbstractLead", :user => user}.merge(options_hash))
end