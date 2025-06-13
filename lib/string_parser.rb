class StringParser
  def self.call(input)
    return [] if input.strip.empty?

    delimiter, input = extract_delimiter_and_body(input)
    input.split(delimiter).map(&:to_i).select { |num| num <= 1000 }
  end

  private

  def self.extract_delimiter_and_body(input)
    if input.start_with?("//")
      parts = input.split("\n", 2)
      custom_delim = parts[0][2..]
      return Regexp.new(Regexp.escape(custom_delim)), parts[1]
    else
      return /[\n,]+/, input
    end
  end
end