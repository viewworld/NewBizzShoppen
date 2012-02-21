When /^I follow translated "([^"]*)" for lead "([^"]*)"$/ do |link_name, lead_name|
  I18n.locale = :en
  dom_id      = ActionController::RecordIdentifier.dom_id(Lead.where(:header => lead_name).last)
  Then %{I follow "#{I18n.t(link_name)}" within "tr##{dom_id}"}
end

Given /^pagination page size for leads is set to (\d+)$/ do |n|
  Settings.stubs(:default_leads_per_page).returns(n)
end

Given /^pagination page size for deals is set to (\d+)$/ do |n|
  Settings.stubs(:default_deals_per_page).returns(n)
end

#Given /^a lead exists with #([^#]*)# within category "([^"]*)"$/ do |pickle_params,category_name|
#  category = Category.find_by_name(category_name).last
#  Given %{a lead exists with #{pickle_params}, category_id: #{category.id}}
#end

Given /^a lead purchase for lead "([^"]*)" by user "([^"]*)" with role "([^"]*)" exists with attributes "([^"]*)"$/ do |header, email, role, options|
  lead = Lead.where(:header => header).first
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  options_hash.each_pair do |k, v|
    if v.include?("Date.today") or v.include?("Time.now")
      options_hash[k] = eval(v)
    end
  end
  lead.lead_purchases.detect{ |lp| lp.owner_id == customer.id }.update_attributes(options_hash)
end

Given /^lead (.+) exists with attributes "([^"]*)"$/ do |header, options|
  lead = Lead.where(:header => header).first
  lead = Lead.make!(:header => header, :category => LeadCategory.make!) if lead.nil?

  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  options_hash.each_pair do |k, v|
    if v.include?("Date.today") or v.include?("Time.now")
      options_hash[k] = eval(v)
    end
  end

  lead.update_attributes(options_hash)
end

Given /^lead (.+) exists with currency "([^"]*)"$/ do |header, currency_name|
  unless currency = Currency.where(:name => currency_name).first
    currency = Currency.make!(:name => currency_name)
  end
  lead = Lead.where(:header => header).first
  if lead.nil?
    Lead.make!(:header => header, :currency => currency, :category => LeadCategory.make!)
  else
    lead.update_attribute(:currency, currency)
  end
end

Given /^purchase for lead "([^"]*)" and user "([^"]*)" exists with attributes "([^"]*)"$/ do |header, email, options|
  user = User::Supplier.find_by_email(email)
  lead = Lead.where(:header => header).first
  lead_purchase = lead.lead_purchases.detect { |lp| lp.owner == user }
  lead_purchase.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Given /^lead (.+) exists within category (.+)$/ do |header, category_name|
  category = Category.where(:name => category_name).first
  category = LeadCategory.make!(:name => category_name) if category.nil?

  lead = Lead.make!(:header => header, :category => category)
end

Given /^bought lead (.+) exists within category (.+)$/ do |header, category_name|
  category = Category.where(:name => category_name).first
  category = LeadCategory.make!(:name => category_name) if category.nil?

  lead = Lead.make!(:header => header, :category => category)
  LeadSinglePurchase.make!(:lead_id => lead.id, :owner => User::Supplier.make!, :paid => true, :accessible_from => Time.now)
end

Given /^a lead (.+) exists within category (.+) and is bought by user (.+) with role (.+)$/ do |header, category_name, email, role|
  category = Category.where(:name => category_name).first
  category = LeadCategory.make!(:name => category_name) if category.nil?

  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  customer = "User::#{role.camelize}".constantize.make!(:email => email) if customer.nil?
  purchaser = customer.role == "supplier" ? customer : User::LeadSupplier.find(customer.id)
  if role == "lead_supplier"
    customer = customer.parent.send(:casted_class).find(customer.parent_id)
  elsif role == "category_supplier"
    customer = User::Supplier.find(customer.id)
  end
  lead = Lead.where(:header => header).first
  if lead.nil?
    lead = Lead.make!(:header => header, :category => category)
  else
    lead.update_attribute(:category, category)
  end
  LeadSinglePurchase.make!(:lead_id => lead.id, :owner => customer, :paid => true, :accessible_from => Time.now, :purchaser => purchaser)
end

Given /^lead (.+) is bought by user (.+) with role (.+) and is assigned to user (.+) with role (.+)$/ do |header, email, role, assignee_email, assignee_role|
  lead = Lead.where(:header => header).first
  lead = Lead.make!(:header => header) if lead.nil?

  if assignee_role == "lead_supplier"
    assignee_role = "lead_user"
  end

  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assignee = "User::#{assignee_role.camelize}".constantize.find_by_email(assignee_email)

  LeadSinglePurchase.make!(:lead_id => lead.id, :owner => customer, :assignee => assignee, :paid => true, :accessible_from => Time.now)
end

Given /^lead (.+).is created by user (.+) with role (.+)$/ do |name, email, role|
  u = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  lead = Lead.where(:header => name).first
  lead.update_attributes({ :creator_id => u.id, :published => true}) unless lead.nil?
  published = (role != "member")
  lead = Lead.make!(:header => name, :creator_id => u.id, :creator_type => "User::#{role.camelize}", :published => published) if lead.nil?
  lead.lead_translations.each { |lt| lt.destroy if lt.locale != "en" }
end

Given /^lead "([^"]*)".is created in category "([^"]*)" by user "([^"]*)" with role "([^"]*)"$/ do |name, category_name, email, role|
  u = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  category = Category.where(:name => category_name).first
  published = (role != "member")
  lead = Lead.make!(:header => name, :creator_id => u.id, :creator_type => "User::#{role.camelize}", :published => published, :category => category)
  lead.lead_translations.each { |lt| lt.destroy if lt.locale != "en" }
end

Given /^I can see following () f for lead Printers ultimate deal$/ do |fields, lead_header|

end

Given /^lead "([^"]*)" was requested by user "([^"]*)" with role "([^"]*)"(?: and is owned by user "([^"]*)")?$/ do |header, email, role, owner_email|
  if role == "lead_supplier"
    role = "lead_user"
  end
  u = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  lead = Lead.where(:header => header).first
  owner = User::Supplier.first(:conditions => { :email => owner_email })
  LeadRequest.make!(:requested_by => u.id, :lead => lead, :owner => owner)
end

Given /^I make ajax call to save lead purchase for lead (.+)$/ do |header|
  lead = Lead.where(:header => header).first
  Then %{I run javascript update_lead_response_deadline('/suppliers/lead_purchases/#{lead.lead_purchases.last.id}', $('#response_deadline_datepicker_#{lead.lead_purchases.last.id}').val())}
end

Given /^there are "([^"]*)" existing leads$/ do |num|
  num.to_i.times{Lead.make!}
end

Given /^there are "([^"]*)" sold leads$/ do |num|
  num.to_i.times{LeadSinglePurchase.make!(:lead => Lead.make!, :owner => User::Supplier.make!, :paid => true, :accessible_from => Time.now)}
end

Given /^there are "([^"]*)" leads in category "([^"]*)"$/ do |num,category_name|
  category = Category.where(:name => category_name).first
  num.to_i.times do
    Lead.make!(:category => category)
  end
end

Given /^(.+) is a best seller$/ do |header|
  lead = Lead.where(:header => header).first
  (Lead.maximum(:lead_purchases_counter)+1).times do
    LeadSinglePurchase.make!(:lead_id => lead.id, :owner => User::Supplier.make!, :paid => true, :accessible_from => Time.now)
  end
end

Given /^lead (.+) has price (.+)$/ do |header,price|
  lead = Lead.where(:header => header).first
  lead.update_attribute(:price, price)
end

Given /^lead (.+) has purchase value (.+)$/ do |header,pv|
  lead = Lead.where(:header => header).first
  lead.update_attribute(:purchase_value, pv)
end

Given /^lead (.+) has (.+) lead purchases$/ do |header,number|
  lead = Lead.where(:header => header).first
  lead.lead_purchases.size.should == number.to_i
end


Given /^lead "([^"]*)" has translation for lang "([^"]*)" with attributes "([^"]*)"$/ do |header, locale_lang, options|
  lead = Lead.where(:header => header).first
  lead_translation = LeadTranslation.create(:lead_id => lead.id, :locale => locale_lang)
  lead_translation.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Given /^lead (.+) has deadline in (\d+) days from now$/ do |header,days|
  lead = Lead.where(:header => header).first
  lead.lead_purchases.first.update_attribute(:response_deadline, Date.today+days.to_i.days)
end

Given /^LeadPurchase statuses are updated$/ do
  LeadPurchase.accessible.about_to_expire.each do |lp|
    lp.about_to_expire!
  end

  LeadPurchase.accessible.expired.each do |lp|
    lp.expire!
  end
end

Then /^list item should be highlighted$/ do
  page.all(:css,"tr[class*='highlight']").size.should eql(1)
end

Given /^a lead "([^"]*)" has (good|bad) rating$/ do |header, rating_type|
  lead = Lead.where(:header => header).first
  lead.lead_purchases.first.update_attributes(:rating_level => rating_type == "good" ? 0 : 12, :rating_reason => rating_type == "bad" ? "Lorem ipsum dolor sit amet" : nil)
end

Given /^All leads have refreshed average ratings$/ do
  Lead.all.each do |lead|
    lead.calculate_average_rating
    lead.save
  end
end

Given /^lead named "([^"]*)" is owned by user "([^"]*)" with role "([^"]*)"$/ do |header, email, role|
  lead = Lead.where(:header => header).first
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert !lead.lead_purchases.detect { |lp| lp.owner_id == customer.id  }.nil?
end

Given /^lead named "([^"]*)" is assigned to user "([^"]*)" with role "([^"]*)"$/ do |header, email, role|
  lead = Lead.where(:header => header).first
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert !lead.lead_purchases.detect { |lp| lp.assignee_id == customer.id  }.nil?
end

Given /^lead named "([^"]*)" is paid and accessible for user with email "([^"]*)" and role "([^"]*)"$/ do |header, email, role|
  lead = Lead.where(:header => header).first
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  lead_purchase = lead.lead_purchases.detect { |lp| lp.owner_id == customer.id  }
  assert lead_purchase.paid == true
  assert !lead_purchase.accessible_from.nil?
end

Given /^cart for user "([^"]*)" is paid by paypal$/ do |email|
  user = User.where(:email => email).first.with_role
  user.cart.fake_paypal_payment
end

Given /^lead named "([^"]*)" (is published|is not published)$/ do |header, is_published|
  lead = Lead.where(:header => header).first
  lead.published = (is_published == "is published")
  lead.save
end

Given /^there are no leads$/ do
  Lead.delete_all
end

Given /^there are no countries$/ do
  Country.destroy_all
end

When /^lead "([^"]*)" has attributes "([^"]*)"$/ do |lead_header, options|
  lead = Lead.where(:header => lead_header).first
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  lead.update_attributes(attrs)
end

When /^lead "([^"]*)" is published$/ do |lead_header|
  lead = Lead.where(:header => lead_header).first
  lead.published = true
  lead.save!
end

Given /^lead "([^"]*)" is created for country "([^"]*)"(?: with region "([^"]*)")?$/ do |header, country, region|
  lead = Lead.where(:header => header).first
  lead = Lead.make!(:header => header, :category => LeadCategory.make!) if lead.nil?
  country = Country.find_by_name(country)
  region = country.nil? ? nil : country.regions.detect { |r| r.name == region }
  lead.update_attributes(:country_id => country.id, :region => region)
end

Then /^last purchase for lead "([^"]*)" has attributes "([^"]*)"$/ do |header, options|
  lead = Lead.where(:header => header).first
  purchase = lead.lead_purchases.last
  Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.each_pair do |method, value|
    assert purchase.send(method).to_s == value.to_s
  end
end

When /^I visit certification url for lead "([^"]*)"$/ do |header|
  lead = Lead.where(:header => header).first
  visit "/leads/#{lead.id}/edit?token=#{lead.current_lcr.token}"
end

When /^I visit certification url for lead "([^"]*)" on "([^"]*)"$/ do |header,date|
  date = Date.strptime(date).to_datetime.utc
  lead = Lead.where(:header => header).first
  visit "/leads/#{lead.id}/edit?token=#{lead.current_lcr.token}"
  lead.current_lcr.update_attribute(:last_visit_date, date)
end

Then /^last certification visit for lead "([^"]*)" should be on "([^"]*)"$/ do |header,date|
  lead = Lead.where(:header => header).first
  lead.current_lcr.last_visit_date.should == Date.strptime(date).to_datetime.utc
end

Then /^last certification visit for lead "([^"]*)" should be today$/ do |header|
  lead = Lead.where(:header => header).first
  lead.current_lcr.last_visit_date.to_date.should == Date.today
end

When /^lead "([^"]*)" is certified$/ do |header|
  lead = Lead.where(:header => header).first
  lead.lead_certification_requests.create
  lead.current_lcr.change_state("agreed")
end

When /^lead "([^"]*)" certification request is sent$/ do |header|
  lead = Lead.where(:header => header).first
  lead.lead_certification_requests.create
end

When /^lead "([^"]*)" certification request has attributes "([^"]*)"$/ do |header, options|
  lead = Lead.where(:header => header).first
  lead.lead_certification_requests.create if lead.current_lcr.nil?
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  lead.current_lcr.update_attributes(attrs)
end

Then /^lead "([^"]*)" certification status should be "([^"]*)"$/ do |header, expected_state|
  lead = Lead.where(:header => header).first
  lead.current_lcr.state.should == expected_state.to_i
end

When /^lead certification request for lead "([^\"]*)" has expired$/ do |header|
  lead = Lead.where(:header => header).first
  lead.current_lcr.expire!
end

When /^lead certification request for lead "([^\"]*)" has its state updated$/ do |header|
  lead = Lead.where(:header => header).first
  lead.current_lcr.update_state!
end

When /^lead "([^"]*)" should be in category "([^"]*)"$/ do |header, name|
  lead = Lead.where(:header => header).first
  assert lead.category == Category.where(:name => name).first
end

When /^price for lead "([^"]*)" is set to "([^"]*)"$/ do |header, default_price|
  lead = Lead.where(:header => header).first
  assert lead.price.to_s == default_price
end

Given /^lead "([^"]*)" should be bought by user with email "([^"]*)"$/ do |header, email|
  lead = Lead.where(:header => header).first
  user = User.where(:email => email).first.with_role
  assert !lead.lead_purchases.detect { |lp| lp.owner_id == user.id }.nil?
end

Given /^lead "([^"]*)" should be created by user "([^"]*)"$/ do |header, email|
  lead = Lead.where(:header => header).order("created_at DESC").first
  user = User.where(:email => email).first.with_role
  assert lead.creator.with_role == user
end

Given /^lead "([^"]*)" should have the following deal code "([^"]*)"$/ do |header, deal_code|
  lead = Lead.where(:header => header).order("created_at DESC").first
  assert lead.hidden_description.to_s.include?(deal_code)
end

Given /^lead "([^"]*)" is bought by someone$/ do |header|
  lead = Lead.where(:header => header).order("created_at DESC").first
  LeadPurchase.make!(:lead_id => lead.id)
end

Given /^lead "([^"]*)" is generated by some deal$/ do |header|
  lead = Lead.where(:header => header).order("created_at DESC").first
  lead.update_attribute(:deal_id, Deal.make!.id)
end