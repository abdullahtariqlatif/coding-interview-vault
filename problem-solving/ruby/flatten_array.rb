arr1 = [0,1,2,[3,4,5],[6,7,8,9,10,[11,[12]]],13]
# Expected output
# [0,1,2,3,4,5,6,7,8,9,10,11,12,13]


def flatten_array(arr, flattened_array)
  arr.each do |item|
    if item.class == Array
      flatten_array(item, flattened_array)
    else
      flattened_array << item
    end
  end

  flattened_array
end

def flat_array(arr)
  flattened_array = []

  flatten_array(arr, flattened_array)
end


print flat_array(arr1)
