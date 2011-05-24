When /^comment for lead "([^"]*)" was posted by user "([^"]*)" with attributes "([^"]*)"$/ do |lead_header, email, options|
  lead = Lead.find_by_header(lead_header).first
  user = User.find_by_email(email).with_role
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  Comment.make!({:commentable_id => lead.id, :commentable_type => "AbstractLead", :user => user}.merge(options_hash))
end

When /^comment thread for lead "([^"]*)" was posted by users "([^"]*)"$/ do |lead_header, user_emails|
  lead = Lead.find_by_header(lead_header).first
  users = user_emails.split(",").map{ |e| e.strip }.map { |email| User.find_by_email(email).with_role }
  parent_id = nil
  users.each_with_index do |user, i|
    comment = Comment.make!(:commentable_id => lead.id, :commentable_type => "AbstractLead", :user => user, :parent_id => parent_id, :title => "Comment title ##{i+1}")
    parent_id = comment.id
  end
end

When /^comments for lead "([^"]*)" are read by by users "([^"]*)"$/ do |lead_header, user_emails|
  lead = Lead.find_by_header(lead_header).first
  users = user_emails.split(",").map{ |e| e.strip }.map { |email| User.find_by_email(email).with_role }
  lead.comment_threads.each do |comment|
    users.each do |user|
      comment.comment_readers.create(:user => user)
    end
  end
end
When /^comments for lead "([^"]*)" (should not|should) be read by user "([^"]*)"$/ do |lead_header, should_be_read, user_email|
  lead = Lead.find_by_header(lead_header).first
  user = User.find_by_email(user_email).with_role

  if should_be_read == "should"
    assert lead.comment_threads.unread_by_user(user).count == 0
  else
    assert lead.comment_threads.unread_by_user(user).count == lead.comment_threads.count
  end
end