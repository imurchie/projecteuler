#!/usr/bin/env ruby
# encoding: utf-8


# answer: 142913828922
#         



def sum_primes(num)
  nums = Hash.new{true}

  (2...num**(0.5)).each do |x|
    if nums[x]
      i = x
      while x*i < num
        nums[x*i] = false
        i += 1
      end
    end
  end
  
  sum = 0
  (2...num).each { |x| sum += x if nums[x] }
  sum
end

puts sum_primes(2_000_000)
exit