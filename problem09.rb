#!/usr/bin/env ruby
# encoding: utf-8




a = 1
b = 2
c = 997



1.upto(500) do |a|
  (a+1).upto(500) do |b|
    c = 1000 - a - b
    if (a ** 2 + b ** 2 == c ** 2)
      puts "a = #{a}, b = #{b}, c = #{c}"
      puts a * b * c
      exit
    end
  end
end