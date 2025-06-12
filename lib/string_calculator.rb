require_relative 'string_parser'
require_relative 'negative_number_validator'

class StringCalculator
  def initialize(parser = StringParser, validator = NegativeNumberValidator)
    @parser = parser
    @validator = validator
  end

  def call(numbers)
    return 0 if numbers.strip.empty?

    @validator.call!(@parser.call(numbers)).sum
  end
end