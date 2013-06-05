#!/usr/bin/env ruby
# encoding: utf-8

largest_chain = 0
largest_num = 0

1.upto(999_000) do |num|
  t_num = num
  print "num: #{num}, "
  
  count = 1
  while num != 1
    if num % 2 == 0
	    num /= 2
	  else
	    num = num * 3 + 1
    end
	  count += 1
  end
  puts "count: #{count}"
  
  if count > largest_chain
    largest_chain = count
    largest_num = t_num
  end
end


puts "#{largest_num}: count = #{largest_chain}"