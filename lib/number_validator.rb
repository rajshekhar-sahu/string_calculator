class NumberValidator
  def self.call(input)
    return input if input.empty? || input.all?(&:positive?)
  end
end