
def factorial(n)
  return 1 if n <= 1
  
  return n * factorial(n-1)
end

def sum_of_fac?(n)
  n_digits = n.to_s.split("").map { |i| i.to_i }
  
  sum = n_digits.inject(0) { |total, i| total + factorial(i) }
  
  return n == sum
end



values = []


3.upto(1000000) do |i|
  if sum_of_fac?(i)
    values << i
  end
end

p values
puts "sum: #{values.inject(:+)}"