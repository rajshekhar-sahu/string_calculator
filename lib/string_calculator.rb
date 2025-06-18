require_relative 'string_parser'
require_relative 'negative_number_validator'

class StringCalculator
  def self.call(numbers)
    return 0 if numbers.strip.empty?

    numbers, delimiters = StringParser.call(numbers, true)
    NegativeNumberValidator.call!(numbers)

    if delimiters.size == 1 && delimiters.first.squeeze == '*'
      numbers.reduce(:*)
    else
      numbers.sum
    end
  end
end