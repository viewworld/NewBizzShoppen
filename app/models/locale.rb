class Locale < Struct.new(:code)
  CODES = ['en', 'dk']
  def self.all
    CODES.map{|c|new(c)}
  end
  alias_method :to_s, :code
end