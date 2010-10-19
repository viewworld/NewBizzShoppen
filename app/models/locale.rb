class Locale
  CODES = ['en', 'dk']

  attr_accessor :code

  def initialize(code)
    self.code = code
  end

  def self.all
    locales = []
    CODES.each do |code|
      locales << Locale.new(code)
    end

    locales
  end
end