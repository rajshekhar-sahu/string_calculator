class StringParser
  def self.call(input)
    return [] if input.strip.empty?

    input.split(/[\n,]+/).map(&:to_i)
  end
end