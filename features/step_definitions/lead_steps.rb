When /^I follow translated "([^"]*)" for lead "([^"]*)"$/ do |link_name, lead_name|
  I18n.locale = :en
  dom_id      = ActionController::RecordIdentifier.dom_id(Lead.find_by_header(lead_name).last)
  Then %{I follow "#{I18n.t(link_name)}" within "li##{dom_id}"}
end

Given /^pagination page size for leads is set to (\d+)$/ do |n|
  Settings.stubs(:default_leads_per_page).returns(3)
end

#Given /^a lead exists with #([^#]*)# within category "([^"]*)"$/ do |pickle_params,category_name|
#  category = Category.find_by_name(category_name).last
#  Given %{a lead exists with #{pickle_params}, category_id: #{category.id}}
#end

Given /^lead (.+) exists with attributes "([^"]*)"$/ do |header, options|
  lead = Lead.find_by_header(header).first
  lead = Lead.make!(:header => header, :category => category) if lead.nil?
  lead.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Given /^lead (.+) exists within category (.+)$/ do |header, category_name|
  category = Category.find_by_name(category_name).last
  category = Category.make!(:name => category_name) if category.nil?

  lead = Lead.make!(:header => header, :category => category)
end

Given /^a lead (.+) exists within category (.+) and is bought by user (.+) with role (.+)$/ do |header, category_name, email, role|
  category = Category.find_by_name(category_name).last
  category = Category.make!(:name => category_name) if category.nil?

  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  lead = Lead.find_by_header(header).first
  if lead.nil?
    lead = Lead.make!(:header => header, :category => category)
  else
    lead.update_attribute(:category, category)
  end
  LeadPurchase.make!(:lead_id => lead.id, :owner => customer, :paid => true, :accessible => true)
end

Given /^lead (.+).is created by user (.+) with role (.+)$/ do |name, email, role|
  u = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  lead = Lead.make!(:header => name, :creator_id => u.id, :published => true)
  lead.lead_translations.each { |lt| lt.destroy if lt.locale != "en" }
end

Given /^I can see following () f for lead Printers ultimate deal$/ do |fields, lead_header|

end