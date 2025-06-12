class StringParser
  def self.call(input)
    return [] if input.strip.empty?

    delimiter = /[\n,]+/

    if input.start_with?("//")
      parts = input.split("\n", 2)
      custom_delim = parts[0][2..]
      delimiter = Regexp.new(Regexp.escape(custom_delim))
      input = parts[1]
    end

    input.split(delimiter).map(&:to_i).select { |num| num <= 1000 }
  end
end