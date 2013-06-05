

# circular primes are primes whose permutations are primes, too.

def is_prime?(n)
  2.upto(Math::sqrt(n)) { |i| return false if n % i == 0 }
  true
end

def get_rotations(arr)
  rot = []
  
  t = arr.clone
  
  t.length.times do |i|
    rot << t.join("").to_i
    
    t.rotate!
  end
  
  rot
end


def circular?(n)
  n_digits = n.to_s.split("").map { |i| i.to_i }
  
  get_rotations(n_digits).each do |i|
    next if i == n  # no need to text the same one we already have
    
    return false unless is_prime?(i)
  end
  
  true
end




values = []

2.upto(1_000_000) do |i|
  if is_prime?(i)
    if circular?(i)
      values << i
    end
  end
end


p values
puts "Number: #{values.length}"