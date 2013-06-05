

# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# 
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.



# I was going to see if there were a pattern, but...
n = 0
1.upto(1000) do |i|
  n += i ** i
  if i % 10 == 0
    puts "#{i}: #{n.to_s.slice(-10, 10)}"
  end
end