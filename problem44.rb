require "set"

# P(n)=n(3n−1)/2

# Find the pair of pentagonal numbers, P(j) and P(k), for which their sum and difference are pentagonal and D = |P(k) − P(j)| is minimised; what is the value of D?


pentagonals = (1..3000).map { |n| n*(3*n-1)/2 }.to_set
results = pentagonals.to_a.combination(2).select { |a,b|
	pentagonals.include?(a+b) && pentagonals.include?((a-b).abs)
}

lowest = results.map { |a,b| (a-b).abs }.min

puts lowest