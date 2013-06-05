#!/usr/bin/env ruby
# encoding: utf-8

require "benchmark"

# 20 x 20
# answer: 137846528820

def traverse(x_len, y_len, x, y)
  #x_len = grid.length
  #y_len = grid[0].length
  #puts "#{$count}"
  #$count +=1
  
  if x == x_len-1
    if y == y_len-1
      return 1
    else
      return 1 + traverse(x_len, y_len, x, y+1)
    end
  end
  
  if y == y_len-1
    if x == x_len-1
      return 1
    else
      return 1 + traverse(x_len, y_len, x+1, y)
    end
  end
  
  #return 1 if x == x_len-1 && y == y_len-1
  
  return 2 + traverse(x_len, y_len, x+1, y) + traverse(x_len, y_len, x, y+1)
end

def factorial(n)
  return 1 if n == 1.0
  return n * factorial(n-1)
end

a = 20
b = 20

paths = factorial(a+b) / (factorial(b) * factorial(a))
p paths

#Benchmark.bm do |x|
#  1.upto(20) do |i|
#    x.report(i) { puts traverse(i, i, 0, 0) }
#  end
#end

#  1: 1
#  2: 6
#  3: 24
#  4: 88
#  5: 320
#  6: 1174
#  7: 4354
#  8: 16300
#  9: 61488
# 10: 233374

