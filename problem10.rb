#!/usr/bin/env ruby
# encoding: utf-8


def is_prime?(n)
  2.upto(Math::sqrt(n)) { |i| return false if n % i == 0 }
  true
end


sum = 2

3.upto(2_000_000) { |i| sum += i if is_prime?(i) }

p sum