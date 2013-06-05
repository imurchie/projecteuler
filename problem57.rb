

# It is possible to show that the square root of two can be expressed as an infinite continued fraction.
# 
# √2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
# 
# By expanding this for the first four iterations, we get:
# 
# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
# 
# The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.
# 
# In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?


def t(iter)
  return [1, 2] if iter == 1
  
  n = 1
  d = 2
  
  1.upto(iter-1) do |j|
    # add 2
    n += 2 * d
    
    # invert
    n, d = d, n
  end
  
  [n, d]
end

def digit_count(num)
  num.to_s.length
end



count = 0

f_str = "f = 1.0 + 1.0 / (a)"
1.upto(1000) do |i|
  n, d = t(i)
  
  # add the one at the end
  n += d
  
  count += 1 if digit_count(n) > digit_count(d)
end

puts "Count: #{count}"