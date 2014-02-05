def stub_currency_euro
  currency_atts = {:name => 'EUR', :symbol => '&euro;', :format => '%u%n',
                   :active => true, :exchange_rate => 1, :separator => '.',
                   :delimiter => ',', :unit_name => nil, :subunit_name => nil, :global_default => false}
  allow(Currency).to receive(:euro).and_return(Currency.new(currency_atts))
end
