# Find the subarray with consecutive elements that yields the maximum sum
# when those elements are added together.
# The goal is to identify a contiguous sequence of numbers within an array,
# such that the sum of these numbers is maximized

def max_subarray_sum(nums)
  max_sum = current_sum = nums[0]

  nums[1..].each do |num|
    current_sum = [num, current_sum + num].max
    max_sum = [max_sum, current_sum].max
  end

  return max_sum
end

# Example usage:
array = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
result = max_subarray_sum(array)
puts "Maximum subarray sum is #{result}"
