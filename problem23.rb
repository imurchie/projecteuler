def abundant?(n)
  # a number of "abundant" if the sum of its proper divisors is greater than the number iself
  sum = (1..n/2).inject(0) do |total, i|
    #puts "#{i}: #{total}"
    n % i == 0 ? total + i : total
  end
  
  sum > n
end

# 28123 is the theoretical lower limit, after which all numbers can be the sum of two abundant numbers
abundant_nums = []
1.upto(28123) do |i|
  if abundant?(i)
    abundant_nums << i
  end
end

sums = []
abundant_nums.sort.each_with_index do |i, index|
  (index).upto(abundant_nums.length-1) do |j|
    sum = i + abundant_nums[j]
    if sum <= 28123
      sums << sum
    end
  end
end

puts ((1..28123).to_a - sums).inject(:+)