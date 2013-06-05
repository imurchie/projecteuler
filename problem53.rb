def factorial(n)
  return 1 if n <= 1
  return n * factorial(n-1)
end

def selection(n, r)
  raise ArgumentError if r > n
  
  factorial(n) / (factorial(r) * factorial(n-r))
end


count = 0

# we know 23c10 is the lowest
23.upto(100) do |n|
  1.upto(n) do |r|
    count += 1 if selection(n, r) > 1_000_000
  end
end

puts "Total: #{count}"