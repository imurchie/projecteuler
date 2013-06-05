


# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
# 
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

def digits(num)
  return num.to_s.split("").map { |i| i.to_i }
end

def fits?(num)
  n1 = digits(num).sort
  
  if digits(num * 2).sort == n1 && digits(num * 3).sort == n1 && digits(num * 4).sort == n1 && digits(num * 5).sort == n1 && digits(num * 6).sort == n1
    return true
  else
    return false
  end
end


100000.upto(1000000) do |i|
  puts i
  if fits?(i)
    puts "lowest: #{i}"
    break
  end
end