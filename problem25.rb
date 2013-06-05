
term = 2
n, p = 1, 1
loop do
  break if n.to_s.length == 1000
  
  #puts "term: #{term}, #{n}" if term < 10
  
  n, p = n+p, n
  term += 1
end

puts "#{term}"