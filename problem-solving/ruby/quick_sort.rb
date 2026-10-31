def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = arr[arr.length/2]

  left, equal, right = partition(arr, pivot)

  return quick_sort(left) + equal + quick_sort(right)
end

def partition(arr, pivot)
  left, equal, right = [], [], []

  arr.each do |element|
    if element < pivot
      left << element
    elsif element == pivot
      equal << element
    else
      right << element
    end
  end

  return left, equal, right
end

arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_arr = quick_sort(arr)
puts "Original array: #{arr}"
puts "Sorted array: #{sorted_arr}"
