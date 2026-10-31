# Given a Base Number and an Exponent Number
# Calculate the final number.

# Examples:
#
# B = 2, E = 3, Answer = 8
# B = 3, E = 4, Answer = 81
#

def calculate_power(b, e)
  # 0 raised to the power of 0 is indeterminate
  return -1 if b == 0 && e == 0
  # 0 Raised to the power of any number is 0
  return 0 if b == 0

  # Positive Exponent / Absolute Number
  pe = e.abs

  # The loop would not run if exponent is 0 and the result would still be 1.
  # Taking care of the rule that # Any number(other than 0) raised to 0 is 1
  result = 1

  (pe).times do
    result *=b
  end

  # calculate reciprocal if exponent is negative
  result = 1/result if e < 0

  return result
end

# Testing
puts "Example 1: #{calculate_power(2, 3)}"  # Output: 8 (2^3)
puts "Example 2: #{calculate_power(5, 2)}"  # Output: 25 (5^2)
puts "Example 3: #{calculate_power(3, 4)}"  # Output: 81 (3^4)
