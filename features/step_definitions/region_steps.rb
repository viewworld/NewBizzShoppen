Given /^country "([^"]*)" has regions "([^"]*)"$/ do |country_name, regions_list|
  country = Country.where(:name => country_name).first
  regions_list.split(",").map { |r| r.to_s.strip }.each do |region_name|
    country.regions << Region.create(:name => region_name)
  end
  country.save
end