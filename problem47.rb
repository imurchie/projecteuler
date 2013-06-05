require "mathn"
require "set"

# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 × 7
# 15 = 3 × 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
# 
# Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?

def prime_factors(n)
  return [] if n == -1 || n == 0 || n == 1
  
  n = n.abs
  
  factors = []
  
  while n > 1
    prime = false
    Prime.each(n) do |p|
      if n % p == 0
        prime = true
        factors << p
        n /= p
        break
      end
    end
    break unless prime
  end
  
  factors
end

# lowest number with four prime numbers as factors is
num = 2 * 3 * 5 * 7 + 1

count = 0
while count < 4
  factors = prime_factors(num)
  
  if factors.uniq.length == 4
    puts "#{num}: #{factors}"
    count += 1
  else
    count = 0
  end
  
  num += 1
end

puts "Num: #{num-4}"



# answer: 134043


    
exit


primes = Prime.each(1000).to_set

#sorted = primes.to_a.combination(4).map { |a, b, c, d| a * b * c * d }.sort

products = []
primes.to_a.combination().each do |a, b, c|
  
end

puts "possibilities: #{sorted.length}"

#sorted = primes.to_a.sort

0.upto(sorted.length-4) do |i|
  if  sorted[i]+1 == sorted[i+1] &&
      sorted[i]+2 == sorted[i+2] #&&
      #sorted[i]+3 == sorted[i+3]
    puts "First: #{sorted[i]} (#{sorted[i+1]}, #{sorted[i+2]})"
    break
  end
end

exit

count = 0
sorted.each do |i|
  count += 1
  print "#{i}, "
  if count % 10 == 0
    gets
  end
end