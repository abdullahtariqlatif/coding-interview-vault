# Find the factorial of a number

def factorial(num)
  return -1 if num < 0
  return 0 if num == 0

  factorial = 1

  for i in (1..num)
    factorial = factorial * i
  end

  factorial
end

puts factorial(3)


# One can also find factorial with recursion.
def factorial(num)
  return 1 if num == 0
  return -1 if num < 0

  num * factorial(num - 1)
end

puts factorial(5)
