class NumberValidator
  def self.call!(input)
    negatives = input.select(&:negative?)

    if negatives.any?
      raise ArgumentError, "negative numbers are not allowed: #{negatives.join(', ')}"
    end

    input
  end
end