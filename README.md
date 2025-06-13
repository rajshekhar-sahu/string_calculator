# 🧮 String Calculator

A simple Ruby-based **String Calculator** built using **TDD principles**.

It parses a string of numbers, supports various delimiters, and returns their sum. The project is organized with a focus on modularity and testability.

---

## 📦 Features

- ✅ Handles comma- and newline-separated numbers
- ✅ Supports custom delimiters (`//;\n1;2`)
- ✅ Supports multi-character delimiters (`//[***]\n1***2***3`)
- ✅ Supports multiple delimiters (`//[*][%]\n1*2%3`)
- ✅ Handles multiple delimiters of any length (`//[***][##][!]\n1***2##3!4`)
- ✅ Ignores numbers greater than 1000
- ✅ Raises an error for negative numbers with a message:  
  `negative numbers not allowed: -1, -2`

---

## 🚀 Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/rajshekhar-sahu/string_calculator.git
cd string_calculator
```

### 2. Install dependencies
```bash
bundle install
```

### 3. Run tests
```bash
bundle exec rspec
```

---

## 🔧 Usage

In `irb` or another Ruby script:

```ruby
require_relative 'lib/string_calculator'

StringCalculator.call("1,2,3")                     # => 6
StringCalculator.call("1\n2,3")                    # => 6
StringCalculator.call("//;\n1;2")                  # => 3
StringCalculator.call("//[***][#][%%]\n1***2#3%%4") # => 10
StringCalculator.call("2,1001")                    # => 2
```

### ❗ Negative Number Example
```ruby
StringCalculator.call("1,-2,-3")
# => ArgumentError: negative numbers not allowed: -2, -3
```

---

## 👤 Author

**Rajshekhar Sahu**  
[LinkedIn](https://www.linkedin.com/in/rajshekhar-sahu/)

---