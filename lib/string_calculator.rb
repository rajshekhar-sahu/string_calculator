require_relative 'string_parser'
require_relative 'negative_number_validator'

class StringCalculator
  def self.call(numbers)
    return 0 if numbers.strip.empty?

    NegativeNumberValidator.call!(StringParser.call(numbers)).sum
  end
end