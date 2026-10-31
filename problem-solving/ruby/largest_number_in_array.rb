# Find k number of largest numbers in an array.

k = 3
number_array = [2, 3, 5, 7, 10, 999, 20]

sorted_array = number_array.sort()

puts "Sorted Array:"
print sorted_array

def k_largest_number(k, sorted_arr)
  if k > sorted_arr.length
    return -1;
  end

  sorted_arr[-k]
end

puts "\n The #{k} largest number is:"
puts k_largest_number(k, sorted_array)
