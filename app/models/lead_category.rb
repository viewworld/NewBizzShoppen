class LeadCategory < Category
  belongs_to :currency
  validates_presence_of :currency_id
  validates_numericality_of :default_price, :greater_than_or_equal_to => 0

  acts_as_newsletter_source

  def self.for_company_name(company_name)
    company_name = company_name.to_s.strip
    LeadCategory.joins(:translations).where("lower(category_translations.name) = ?", company_name.downcase).first ||
      LeadCategory.create(:name => company_name, :currency => Currency.default_currency, :buyout_enabled => false)
  end
end
