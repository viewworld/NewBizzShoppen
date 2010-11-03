Given /^I follow translated "([^"]*)" within "([^"]*)" category$/ do |key, category_name|
  I18n.locale = :en
  Then %{I follow "#{I18n.t(key)}" within "li##{ActionController::RecordIdentifier.dom_id(Category.find_by_name(category_name).last)}"}
end

Given /^Category named "([^"]*)" already exists(?: within category named "([^"]*)")?$/ do |name, parent_category_name|
  parent_category_id =  parent_category_name.present? ? Category.where(:name => parent_category_name).last.id : nil
  Category.make(:name => name, :parent_id => parent_category_id).tap do |c|
    c.save!
  end
end


Given /^Lead named "([^"]*)" exists within "([^"]*)" category$/ do |name, category_name|
  category_id =  if category_name
                   Category.find_by_name(category_name).last.id
                 else
                   Category.make!.id
                 end
  Lead.make!(:header => name, :category_id =>category_id)
end

Then /^I should see category named "([^"]*)" within category named "([^"]*)"$/ do |child_category_name, parent_category_name|
  Then %{I should see "#{child_category_name}" within "li##{ActionController::RecordIdentifier.dom_id(Category.find_by_name(parent_category_name).last)}"}
end


When /^I follow translated "([^"]*)" for category "([^"]*)"$/ do |link_name, category_name|
  I18n.locale = :en
  dom_id = ActionController::RecordIdentifier.dom_id(Category.find_by_name(category_name).last)
  Then %{I follow "#{I18n.t(link_name)}" within "li##{dom_id}"}
end