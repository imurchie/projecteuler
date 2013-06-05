#!/usr/bin/env ruby
# encoding: utf-8




def factors(n)
  count = 0
  1.upto(Math::sqrt(n)) { |i| count += 2 if n % i == 0 }
  p "#{n}: #{count}"
  count
end

#"4778686: 16"
#"4781778: 16"
#"4784871: 32"

num = 4778686
i = 3092
loop do
  num += i
  break if factors(num) > 500
  
  i += 1
end

p num