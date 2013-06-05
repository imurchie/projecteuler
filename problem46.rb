require_relative "euler"
require "mathn"

# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#
# 9 = 7 + 2×1^2
# 15 = 7 + 2×2^2
# 21 = 3 + 2×3^2
# 25 = 7 + 2×3^2
# 27 = 19 + 2×2^2
# 33 = 31 + 2×1^2
# 
# It turns out that the conjecture was false.
# 
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?



def square?(n)
  s = Math::sqrt(n).to_i
  
  n == s ** 2
end


5.step(1_000_000, 2) do |i|
  next if Euler::is_prime?(i)
  
  puts "#{i}"
  
  found = false
  
  Prime.each(i) do |p|
    puts "    #{p}"
    d = i - p
    if square?(d / 2)
      found = true
      break
    end
  end
  
  unless found
    puts "Cannot: #{i}"
    break
  end
end