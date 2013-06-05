#!/usr/bin/env ruby
# encoding: utf-8

total = 0
1000.times do |i|
  total += i if i % 3 == 0 || i % 5 == 0
end

p total