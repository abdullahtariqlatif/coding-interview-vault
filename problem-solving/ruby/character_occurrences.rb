# Given a character = c and a string = word
# Find the number of times the character is present in the string

# Examples:
#
# Input: string = "banana", character = 'a'
# Output: 3
#
# Input: string = "hello world", character = 'o'
# Output: 2
#

def character_occurrences(string, character)
  # Ensure string and character are valid
  return 0 if string.nil? || character.nil? || character.length != 1

  occr = Hash.new(0)

  str.chars.each do |char|
    occr[char] += 1
  end

  occr
end

# Testing
puts "Occurrences of 'a' in 'banana': #{character_occurrences('banana', 'a')}"  # Example output 3
puts "Occurrences of 'e' in 'hello world': #{character_occurrences('hello world', 'e')}"  # Example output 1
puts "Occurrences of 'z' in 'pizza': #{character_occurrences('pizza', 'z')}"  # Example output 2
