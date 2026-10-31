# Check if a given strings are a Anagrams of each other.

def are_anagrams(str1, str2)
  sorted_str1 = str1.downcase.chars.sort.join
  sorted_str2 = str2.downcase.chars.sort.join

  sorted_str1 == sorted_str2
end

puts are_anagrams("listen", "silent")  # Output: true
puts are_anagrams("hello", "world")    # Output: false
