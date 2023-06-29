require_relative './nmax/number_parser'

module Nmax
  class << self
    def cli
      validate_max_return

      parse_numbers(max_return)
    end

    private

    def validate_max_return
      max_return
    rescue TypeError, ArgumentError
      print('Please enter array size parameter (integer)')
      exit
    end

    def max_return
      Integer(ARGV[0])
    end

    def parse_numbers(max_return)
      NumberParser.new(max_return).call
    end
  end
end
