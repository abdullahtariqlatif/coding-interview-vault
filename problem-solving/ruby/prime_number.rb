# Check if a given number is a Prime number

def is_prime?(number)
  if number <= 1
    return false
  end

  # Consider that if a number N is not a prime number and has a divisor D,
  # then there must be another factor F such that D * F = N.
  # If both D and F are greater than the square root of N,
  # then their product (D * F) would be greater than N,
  # which contradicts the fact that N is the product of D and F.
  # Therefore, one of the factors must be less than or equal to the square root of N.

  for num in 2..Math.sqrt(number)
    return false if number%num == 0
  end

  true
end

numbers = [ 3, 5, 7, 15, 33, 11]

numbers.each do |num|
  puts is_prime?(num)
end
