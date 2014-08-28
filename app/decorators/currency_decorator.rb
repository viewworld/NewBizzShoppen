class CurrencyDecorator < Draper::Decorator
  delegate_all

  def symbol
    object.symbol.html_safe
  end

  def format
    "#{object.format} (#{h.as_currency(1000, currency)})".html_safe
  end

  def updated_at
    l(object.updated_at)
  end
end
