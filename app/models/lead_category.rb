class LeadCategory < Category
  belongs_to :currency
  validates_presence_of :currency_id
  validates_numericality_of :default_price, :greater_than_or_equal_to => 0
end