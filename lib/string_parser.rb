class StringParser
  def self.call(input, provide_del = false)
    return [] if input.strip.empty?

    delimiter_regex, input, delimiters = extract_delimiter_and_body(input.gsub('\n', "\n"))
    numbers = input.split(delimiter_regex).map(&:to_i).select { |num| num <= 1000 }
    return numbers unless provide_del

    [numbers, delimiters]
  end

  private

  def self.extract_delimiter_and_body(input)
    if input.start_with?("//")
      parts = input.split("\n", 2)
      custom_delimiters = extract_custom_delimiter(parts[0][2..])
      return Regexp.union(custom_delimiters), parts[1], custom_delimiters
    else
      return /[\n,]+/, input, []
    end
  end

  def self.extract_custom_delimiter(header)
    if header.start_with?("[")
      header.scan(/\[(.*?)\]/).flatten
    else
      return [header]
    end
  end
end