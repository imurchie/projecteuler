#!/usr/bin/env ruby
# encoding: utf-8


total = 0

p = 1
n = 1
while n < 4_000_000
  n, p = n+p, n
  total += n if n.even?
end

p total