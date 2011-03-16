module RegionsHelper
  def regions_collection_for(country)
    country.present? ? country.regions : []
  end
end