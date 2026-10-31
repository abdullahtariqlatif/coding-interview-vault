# Given two variables, a and b
# Swap the values for both of them without using a third variable

# Examples:
#
# Input: a = 5, b = 10
# Output: a = 10, b = 5
#
# Input: a = -3, b = 7
# Output: a = 7, b = -3
#
#
# Input: a = Hello, b = World
# Output: a = World, b = Hello
#

def swap_variables(a, b)
  return swap_numbers(a,b) if a.is_a?(Integer) && b.is_a?(Integer)
  return swap_strings(a,b) if a.is_a?(String) && b.is_a?(String)
  return swap_arrays(a,b) if a.is_a?(Array) && b.is_a?(Array)

  return -1
end

def swap_numbers(a,b)
  a = a + b
  b = a - b
  a = a - b

  return a, b
end

def swap_strings(a,b)
  a = a + b # Concatenating # This is now TotalString
  # TotalString minus the length of characters in b, Gives us the value of a
  b = a[0..-(b.length + 1)] # As -1 is till end so adding 1 to b.length to account for it.
  # TotalString minus the length of characters in a, Gives us the value of b
  a = a[(b.length)..-1]

  return a, b
end

def swap_arrays(a,b)
  a = a + b # Concatenating # This is now TotalItems
  # TotalItems minus the length of items in b, Gives us the value of a
  b = a[0..-(b.length + 1)] # As -1 is till end so adding 1 to b.length to account for it.
  # TotalItems minus the length of items in a, Gives us the value of b
  a = a[(b.length)..-1]

  return a, b
end

# Testing
puts "Example 1: #{swap_variables(5, 10)}"  # Output: [10, 5]
puts "Example 2: #{swap_variables(-3, 7)}"  # Output: [7, -3]
puts "Example 3: #{swap_variables(0, 0)}"   # Output: [0, 0]
puts "Example 4: #{swap_variables('Hello', 'World')}"  # Output: ['World', 'Hello']
puts "Example 5: #{swap_variables([1, 2], [3, 4])}"    # Output: [[3, 4], [1, 2]]


# Foot Notes
# swap_strings and swap_arrays have the same logic. So, you can refactor that with a better method name
# You can also use closures/lamdas in a single method and gatekeep them using the if checks
