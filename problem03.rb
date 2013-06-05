#!/usr/bin/env ruby
# encoding: utf-8

require 'mathn'


num = 600_851_475_143
#num = 13195

def is_prime?(n)
  1.upto(n/2) { |i| return false if n % i == 0 }
  true
end


highest = 1

(Math::sqrt(num)).to_i.downto(1) do |i| 
  if i.prime? && num % i == 0
    highest = i
    break
  end
end

p highest