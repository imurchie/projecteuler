require "mathn"
require "set"

# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: 
#   (i) each of the three terms are prime, and, 
#   (ii) each of the 4-digit numbers are permutations of one another.
# 
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
# 
# What 12-digit number do you form by concatenating the three terms in this sequence?

def is_perm?(num1, num2)
  n1_digits = num1.to_s.split("").map { |i| i.to_i }
  n2_digits = num2.to_s.split("").map { |i| i.to_i }
  
  n1_digits.sort == n2_digits.sort
end


candidates = Prime.each(10_000).reject { |p| p < 1000 || p > 9999 }.to_set




candidates_array = candidates.to_a
candidates_array.each_with_index do |num, index|  
  num1 = candidates.include?(num + 3330)
  num2 = candidates.include?(num + 6660)
  
  if num1 && num2
    if is_perm?(num, num + 3330) && is_perm?(num, num + 6660)
      puts [num, num+3330, num+6660].join("")
    end
  end
end