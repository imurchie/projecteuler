
require "mathn"


# initial states
total = 1
primes = 0
position = 1
step = 2
average = 1
side = 1

while average > 0.1
  primes += 1 if Prime::prime?(position + step)
  
  primes += 1 if Prime::prime?(position + step * 2)
  
  primes += 1 if Prime::prime?(position + step * 3)
  
  total += 4
  position += step * 4
  step += 2
    
  average = primes.to_f / total.to_f
  #puts "#{primes} / #{total} =  #{average}"
end

# "step" increases at the same rate as the side length does, but begins at 1
puts "Side length: #{step-1} (primes: #{primes}, total: #{total}, average: #{average})"