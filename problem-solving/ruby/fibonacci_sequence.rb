# Print the Fibonacci Sequence of a given number

def fibonacci(num)
  return -1 if num < 0
  return [0] if num == 0
  return [0, 1] if num == 1

  seq = [0, 1]

  for i in 2..num
    seq << seq[-2] + seq[-1]
  end

  seq.each { |x| puts x }
end

puts fibonacci(10)
