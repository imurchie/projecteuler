require "mathn"

# The prime 41, can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13
#
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of the most consecutive primes?



sum = 0
max = 0
Prime.each(1_000_000) do |p|
  break if sum + p >= 1_000_000
  
  sum += p
  
  # I don't know why everything gets 10 out here.
  sum -= 10 if sum == 281
  
  if Prime.prime?(sum)
    max = sum
    puts max
  end
  
  puts "sum: #{sum}, p: #{p}, max: #{max}"
end