class StringParser
  def self.call(input)
    return [] if input.strip.empty?

    [input.to_i]
  end
end