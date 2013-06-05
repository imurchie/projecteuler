require_relative "euler"
require "mathn"



highest = 0
count = 0

9.downto(1) do |i|
  digits = (1..i).inject([]) {|arr, e| arr << e }

  perms = digits.permutation.to_a

  puts "Length: #{perms.length}"

  # start with the highest pandigital number...
  perms.each do |i|
    i = i.join("").to_i
    
    count += 1
    #puts i if count % 1000 == 0
    
    if Euler::is_prime?(i)
      puts "prime: #{i}"
      highest = i if i > highest
    end
  end
  
  # if we have a highest now, we will never get anything higher
  break
end

puts "count: #{count}"
puts "highest prime pandigital: #{highest}"