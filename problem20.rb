def factorial(n)
  return 1 if n == 1
  
  return n *factorial(n-1)
end


d = factorial(100).to_s.split("")
sum = d.inject(0) do |total, i| 
  total += i.to_i
end

puts sum