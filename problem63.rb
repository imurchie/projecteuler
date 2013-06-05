

# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
# 
# How many n-digit positive integers exist which are also an nth power?


def get_start(num, d)
  n = num ** (1.0 / d)
  
  n = n.to_i
  n ** d == num ? n : n+1
end


count = 0

0.upto(200) do |i|
  lo = 10 ** i
  hi = 10 ** (i+1) - 1
  
  digits = i + 1
  
  # we want to start with the (i+1)th root of start if it is an int
  n = get_start(lo, digits)
  loop do
    result = n ** digits
    if result <= hi
      count += 1
      #puts "digits: #{digits}; root: #{n}; n-power: #{result}"
    else
      break
    end
    
    n += 1
  end
end

puts "Total: #{count}"