



# there are 11 "truncatable" primes

def is_prime?(n)
  return false if n <= 1
  
  2.upto(Math::sqrt(n)) { |i| return false if n % i == 0 }
  true
end

# want to return the order of magnitude
def order(n)
  o = 1
  while n > 10
    n /= 10
    o *= 10
  end
  
  return o
end

def is_truncatable?(n)
  # from the right
  i = n # we need to modify it, but use n again
  while i > 10
    i /= 10   # start with division, since we've already tested the first value
    
    return false unless is_prime?(i)
  end
  
  # from the left
  mod = order(n)
  i = n
  while i > 10
    i %= mod
    mod /= 10
    
    return false unless is_prime?(i)
  end
  
  true
end






primes = []

i = 10
loop do
  if is_prime?(i)
    
    if is_truncatable?(i)
      primes << i
      puts "prime: #{i}"
    end
    
    # only 11 of them, so we are done when we fine them all
    if primes.length == 11
      break
    end
  end
  
  # next num
  i += 1
end


puts "sum: #{primes.inject(:+)}"