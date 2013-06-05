

# convergence of e


# I could automate this, but I've already written in the array so why bother.
set = [1, 2, 
  1, 1, 4, 
  1, 1, 6, 
  1, 1, 8, 
  1, 1, 10, 
  1, 1, 12,
  1, 1, 14,
  1, 1, 16,
  1, 1, 18,
  1, 1, 20,
  1, 1, 22,
  1, 1, 24,
  1, 1, 26,
  1, 1, 28,
  1, 1, 30,
  1, 1, 32,
  1, 1, 34,
  1, 1, 36,
  1, 1, 38,
  1, 1, 40,
  1, 1, 42,
  1, 1, 44,
  1, 1, 46,
  1, 1, 48,
  1, 1, 50,
  1, 1, 52,
  1, 1, 54,
  1, 1, 56,
  1, 1, 58,
  1, 1, 60,
  1, 1, 62,
  1, 1, 64,
  1, 1, 66,
  1, 1, 68,
  1, 1, 70,
  1, 1, 72,
  1, 1, 74,
  1, 1, 76,
  1, 1, 78
]

3.upto(100) do |i|
  n = 1
  d = nil
  (i-2).downto(1) do |j|
    d ||= set[j]
    n += set[j-1] * d
  
    n, d = d, n
  
  end

  n += 2 * d

  puts "#{i}: #{n} / #{d}"
  puts "sum of numerator digits: #{n.to_s.split("").inject(0) { |t, i| t + i.to_i }}"
end