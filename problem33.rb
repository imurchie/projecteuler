# the answers
# 16/64 = 1/4
# 19/95 = 1/5
# 26/65 = 2/5
# 49/98 = 4/8

def special(n, d)
  # get rid of "trivial" cases
  #10.upto(19) do |i|
  #  return nil if n % i == 0 && d % i == 0
  #end
  
  n_digits = n.to_s.split("").map{ |i| i.to_i }
  d_digits = d.to_s.split("").map{ |i| i.to_i }
  
  0.upto(1) do |i|
    0.upto(1) do |j|
      if n_digits[i] == d_digits[j]
        n_digits.delete_at(i)
        d_digits.delete_at(j)
      end
    end
  end
  
  if n_digits.length == 1 && d_digits.length == 1
    if n_digits[0].to_f / d_digits[0].to_f == n.to_f / d.to_f
      return [n_digits[0], d_digits[0]]
    end
  end
  
  return nil
end


def product(fractions)
  n, d = fractions.inject([1, 1]) do |total, fraction|
    [total[0] * fraction[0], total[1] * fraction[1]]
  end
  
  puts "#{n} / #{d}"
  n.downto(1) do |i|
    if n % i == 0 && d % i == 0
      n /= i
      d /= i
    end
  end
  puts "#{n} / #{d}"
  
  [n, d]
end


special_nums = []

10.upto(99) do |n|
  10.upto(99) do |d|
    next if n >= d
    next if n % 10 == 0 || d % 10 == 0
    
    fraction = special(n, d)
    if fraction
      puts "#{n}/#{d} = #{fraction[0]}/#{fraction[1]}"
      special_nums << fraction 
    end
  end
end

puts "Special fractions: #{special_nums.inspect}"

puts "Product's denominator: #{product(special_nums)[1]}"

