Given /^I follow translated "([^"]*)" within "([^"]*)" category$/ do |key, category_name|
  I18n.locale = :en
  Then %{I follow "#{I18n.t(key)}" within "##{ActionController::RecordIdentifier.dom_id(Category.where(:name => category_name).last)}"}
end

Given /^Category named "([^"]*)" already exists(?: within category named "([^"]*)")?$/ do |name, parent_category_name|
  parent_category_id =  parent_category_name.present? ? Category.where(:name => parent_category_name).last.id : nil
  LeadCategory.make!(:name => name, :parent_id => parent_category_id)
end


Given /^Lead named "([^"]*)" exists within "([^"]*)" category$/ do |name, category_name|
  category_id =  if category_name
                   Category.where(:name => category_name).first.id
                 else
                   LeadCategory.make!(:name => category_name).id
                 end
  Lead.make!(:header => name, :category_id =>category_id)
end

Then /^I should see category named "([^"]*)" within category named "([^"]*)"$/ do |child_category_name, parent_category_name|
  Then %{I should see "#{child_category_name}" within "##{ActionController::RecordIdentifier.dom_id(Category.where(:name => parent_category_name).last)}"}
end


When /^I follow translated "([^"]*)" for category "([^"]*)"$/ do |link_name, category_name|
  I18n.locale = :en
  dom_id = ActionController::RecordIdentifier.dom_id(Category.where(:name => category_name).first)
  Then %{I follow "#{I18n.t(link_name)}" within "li##{dom_id}"}
end

Given /^category named "([^"]*)" (is|is not) locked$/ do |name, is_locked|
  category = Category.where(:name => name).first
  category.update_attribute(:is_locked, is_locked == "is not" ? false : true)
end

Given /^category named "([^"]*)" (is|is not) auto buy enabled/ do |name, is_enabled|
  category = Category.where(:name => name).first
  assert category.auto_buy == (is_enabled == "is" ? true : false)
end

Given /^category named "([^"]*)" (should|should not) be locked$/ do |name, is_locked|
  category = Category.where(:name => name).first
  assert category.is_locked == (is_locked == "should not" ? false : true)
end

Given /^there are no categories$/ do
  Category.delete_all
end

Given /^category "([^"]*)" has attributes "([^"]*)"$/ do |category_name, options|
  category = Category.where(:name => category_name).first
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  category.update_attributes(attrs)
end

Then /^category "([^"]*)" is in interests of user "([^"]*)" "([^"]*)"$/ do |category, email, is_true|
  ::User::Supplier.find_by_email(email).categories.include?(Category.where(:name => category).first).should == (eval(is_true) == true)
end

Then /^category "([^"]*)" has email template - "([^"]*)"$/ do |name, yes_or_no|
  assert Category.find_by_name(name).first.email_template.blank? == ((yes_or_no == "Yes") ? false : true)
end

Then /^category "([^"]*)" has email template with subject "([^"]*)"$/ do |name, subject|
  global_et = EmailTemplate.find_by_uniq_id('bought_lead_notification')
   Category.find_by_name(name).first.create_email_template(:subject => subject, :body => global_et.body, :from => global_et.from)
end

When /^there is no category named "([^"]*)"$/ do |name|
  assert Category.where(:name => name).first.nil?
end

When /^there is a category named "([^"]*)"$/ do |name|
  assert !Category.where(:name => name).first.nil?
end

When /^I follow category "([^"]*)"$/ do |category_name|
  category = Category.where(:name => category_name).first
  dom_id = "##{category.type.to_s.tableize.singularize}_#{category.id}"
  regex = "/categories#{category.is_a?(LeadCategory) ? '' : '\/deals'}\\/#{category.cached_slug}#{"\\?search\\[with_category\\]=#{category.id}" if category.is_a?(LeadCategory)}/"
  Then %{I click hidden link by url regex "#{regex}" within "#{dom_id}"}
end


When /^I follow category for edit "([^"]*)"$/ do |category_name|
  category = Category.where(:name => category_name).first
  dom_id = "##{category.type.to_s.tableize.singularize}_#{category.id}"
  regex = "/administration\\/categories\\/#{category.id}\\/edit/"
  Then %{I click hidden link by url regex "#{regex}" within "#{dom_id}"}
end