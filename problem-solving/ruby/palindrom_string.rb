# Check if a given string is a Palindrom or not

def is_palindrome?(str)
  length = str.length

  if length.even?
    # for peep | string_1 would be str[0..1] and string_2 would be str[2..3]
    string_1, string_2 = str[0..(length/2 - 1)] , str[(length/2..-1)]
  else
    # for level | string_1 would be str[0..1] and string_2 would be str[3..4] | Char at index 2 is 'v'
    string_1, string_2 = str[0..(length/2 - 1)] , str[((length/2 + 1)..-1)]
  end

  return true if string_1 == string_2.reverse

  false
end

# Or one can simply do : return true if str == str.reverse

str1 = "Simplilearn"
str2 = "level"
str3 = 'peep'

puts is_palindrome?(str1)
puts is_palindrome?(str2)
puts is_palindrome?(str3)


def is_palindrome?(str)
  # Remove non-alphanumeric characters and convert to lowercase
  cleaned_str = str.downcase.gsub(/[^a-z0-9]/, '')
  # Use a loop to check if the cleaned string is a palindrome
  left, right = 0, cleaned_str.length - 1

  while left < right
    # Compare characters from the start and end of the string
    if cleaned_str[left] != cleaned_str[right]
      return false
    end
    # Move towards the center of the string
    left += 1 right -= 1
  end

  # If the loop completes without returning false, the string is a palindrome true
end
# Example usage:
puts is_palindrome?("A man, a plan, a canal, Panama!")
# Output: true
puts is_palindrome?("Hello, World!")
# Output: false
