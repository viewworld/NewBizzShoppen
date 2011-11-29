class DecimalToOtherSystemsConverter
  #TODO IREK ZRÓB Z TEGO PLUGIN I NA GITHUB (można dopisać jeszcze TESTY RSPEC!)

  DEFAULT = %w{binary decimal hexadecimal alphabetical}

  #available methods:
  #convert(number, character_set, smallest_size = nil)
  #convert_to_binary(number, smallest_size = nil)
  #convert_to_decimal(number, smallest_size = nil)
  #convert_to_hexadecimal(number, smallest_size = nil)
  #convert_to_alphabetical(number, smallest_size = nil)

  BINARY = ["0", "1"].freeze
  DECIMAL = ("0".."9").to_a.freeze
  HEXADECIMAL = (("0".."9").to_a + ("A".."F").to_a).freeze
  ALPHABETICAL = ("A".."Z").to_a.freeze

  class << self

    def convert(number, character_set, smallest_size = nil)
      character_set_size = character_set.size
      result = ""
      (0..find_size(number, character_set)-1).to_a.reverse.each do |i|
        div_result = number / character_set_size**i
        mod_result = number % character_set_size**i
        result += character_set[div_result]
        number = mod_result
      end
      rjust_with_first_character(result, character_set, smallest_size)
    end

    DEFAULT.each do |name|
      define_method("convert_to_#{name}".to_sym) do |*args|
        raise(ArgumentError, "wrong number of arguments (#{args.size} for 2)") if args.size > 2 or args.size == 0
        convert(args[0], "DecimalToOtherSystemsConverter::#{name.upcase}".constantize, args[1] ||= nil)
      end
    end

    private

    def find_size(number, character_set)
      result = 1
      while number >= character_set.size**result
        result += 1
      end
      result
    end

    def rjust_with_first_character(result, character_set, smallest_size)
      smallest_size ? result.rjust(smallest_size, character_set.first) : result
    end

  end

end