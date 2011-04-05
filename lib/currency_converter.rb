require "cgi"
require "uri"
require "net/https"
require "rexml/document"


module CurrencyConverter
  def self.cache_current_exchange_rates!
    url = URI.parse("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml")
    resp = Net::HTTP.get(url)
    xml  = REXML::Document.new(resp)

    currencies = Currency.all

    xml.elements.each("//gesmes:Envelope/Cube/Cube/Cube") { |t|
      currency = currencies.detect { |c| c.name == t.attribute("currency").to_s }
      currency.update_attribute(:exchange_rate, t.attribute("rate")) if currency
    }

    Currency.find_by_name("EUR").update_attribute(:exchange_rate, 1.0)
    true
  end
end
