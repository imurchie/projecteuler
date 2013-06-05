nums = []

# empirically, it will never be higher than 194979
2.upto(200_000) do |i|
  digits = i.to_s.split("").map { |a| a.to_i }
  
  total = digits.inject(0) { |t, x| t + x ** 5 }
  if total == i
    puts total
    nums << total
  end
end



p nums
p nums.inject(:+)