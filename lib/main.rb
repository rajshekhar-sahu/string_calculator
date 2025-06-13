require_relative 'string_calculator'

def print_sum(input)
  puts "Sum of numbers in '#{input.inspect}': #{StringCalculator.call(input)}"
end

# Test cases for StringCalculator
print_sum('')
print_sum('5')
print_sum('1,2,3')
print_sum("1\n2\n3")
print_sum('1\n2\n3,5,6,7')
print_sum("//;\n1;2;3")

begin
  print_sum("1,-2,3")
rescue ArgumentError => e
  puts "Error in input '1,-2,3': #{e.message}"
end

begin
  print_sum("1,-2,-3")
rescue ArgumentError => e
  puts "Error in input '1,-2,-3': #{e.message}"
end

print_sum("1,2,1001")
print_sum("//[***]\n1***2***3")
print_sum("//[;]\n1;2;3")
print_sum("//[;][|]\n1;2|3")