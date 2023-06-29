
module Nmax
  class NumberParser
    attr_reader :count, :output, :founded_numbers

    READ_SIZE = 1024 * 512

    def initialize(count)
      @count = count
      @output = []
      @founded_numbers = 0
      @min = -Float::INFINITY
    end

    def call
      parse_numbers until $stdin.eof
      append_reserve_number
      output
    end

    def parse_numbers
      input = read
      numbers = input.scan(/\d+/)

      last_digit = last_digit?(input)
      if @reserve_number
        @reserve_number += numbers.shift if first_digit?(input)
        append_reserve_number unless numbers.empty? && last_digit
      end
      @reserve_number = numbers.pop if last_digit && !numbers.empty?

      numbers.each { |number| append_number(number) }
    end

    private

    def last_digit?(input)
      digit?(input&.[](-1))
    end

    def first_digit?(input)
      digit?(input[0])
    end

    def digit?(char)
      return false unless char

      char in ('0'..'9')
    end

    def read
      $stdin.read(READ_SIZE)
    end

    def append_reserve_number
      return unless @reserve_number

      append_number(@reserve_number)
      @reserve_number = nil
    end

    def append_number(number)
      number = number.to_i
      return if @founded_numbers >= count && !@output.empty? && number < @output[0]

      pos = @output.bsearch_index { |num| num >= number }

      @founded_numbers += 1
      if pos
        @output.insert(pos, number)
      else
        @output << number
      end

      @output.shift if @founded_numbers > count
    end
  end
end
