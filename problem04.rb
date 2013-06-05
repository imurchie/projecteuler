

highest = 0
100.upto(999) do |i|
  100.upto(999) do |j|
    prod = i * j
    if prod > highest && prod == prod.to_s.reverse.to_i
      highest = prod
    end
  end
end

p highest