

# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

# 0.123456789101112131415161718192021...



# silly naïve version
decimal = []
0.upto(1_000_001) do |i|
  decimal << i
end

decimal = decimal.join("")

answer = decimal[1].to_i * decimal[10].to_i * decimal[100].to_i * decimal[1000].to_i * decimal[10_000].to_i * decimal[100_000].to_i * decimal[1_000_000].to_i

puts answer