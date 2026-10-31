require 'benchmark'

# Sort an Array from highest to lowest using Bubble Sort

number_array = [3, 2, 5, 7, 10, 999, 20]

def bubble_sort(unsorted_arr)
  arr = unsorted_arr
  n = arr.length

  # Setting the range for i as  n-2 as if given n-1, The length being 5, Then
  # the last comparison would be a[4] > a[4+1], a[5] would be out of bounds
  for i in (0..n - 2)
    # if i is 0 then j would be 1, As we are to compare two adjacent indexes.
    # if i is 0 then the next index to compare it with would be i + 1.
    # The range for it is n - 1 as the last comparison would be arr[n-2] > arr[n-1]
    # Which would be the second last and last element of the array.
    for j in ((i+1)..n - 1)
      if arr[i] > arr[j]
        arr[i], arr[j] = arr[j], arr[i]
      end
    end
  end

  arr
end

puts bubble_sort(number_array)

# Benchmarking the Code
result = Benchmark.measure do
  bubble_sort(number_array)
end

puts "Time taken: #{result.real} seconds"
