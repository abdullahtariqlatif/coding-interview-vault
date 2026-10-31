def merge_sort(arr)
  return arr if arr.length <= 1

  # Split the array into two halves
  mid = arr.length / 2
  left_half = arr[0...mid]
  right_half = arr[mid..-1]

  # Recursively apply merge_sort to both halves
  left_sorted = merge_sort(left_half)
  right_sorted = merge_sort(right_half)

  # Merge the two sorted halves
  merge(left_sorted, right_sorted)
end

def merge(left, right)
  result = []
  left_idx = 0
  right_idx = 0

  # Merge the two sorted arrays into a single sorted array
  while left_idx < left.length && right_idx < right.length
    if left[left_idx] < right[right_idx]
      result << left[left_idx]
      left_idx += 1
    else
      result << right[right_idx]
      right_idx += 1
    end
  end

  # Append any remaining elements from the left and right arrays
  result += left[left_idx..-1] if left_idx < left.length
  result += right[right_idx..-1] if right_idx < right.length

  return result
end


arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_arr = merge_sort(arr)
puts "Original array: #{arr}"
puts "Sorted array: #{sorted_arr}"
