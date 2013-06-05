


# Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?

def digital_sum(num)
  num.to_s.split("").inject(0) { |total, i| total + i.to_i }
end



max = 0

1.upto(99) do |a|
  1.upto(99) do |b|
    sum = digital_sum(a ** b)
    
    max = sum if sum > max
  end
end

puts "Maximum: #{max}"