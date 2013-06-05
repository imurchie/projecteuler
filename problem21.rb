def sum_of_divisors(n)
  sum = (1..n/2).inject(0) do |total, i|
    #puts "#{i}: #{total}"
    n % i == 0 ? total + i : total
  end
end


sums = {}
total = 0

10000.times do |i|
  s = sum_of_divisors(i)
  
  sums[s] = i
  
  #puts "#{i}: #{s}"
  if s != i && sums[i] == s
    puts "#{i}: #{s}"
    total = total + i + s
  end
end

puts total

#puts sum_of_divisors(220)