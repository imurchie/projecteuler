

best_rep = 0
best_num = 0

1000.downto(1) do |i|
  # we will never have a repetition bigger than the number itself
  break if best_rep > i
  
  rem = [0] * i
  val = 1
  pos = 0
  
  # successively go through the remainders until there are none (i.e., val == 0)
  # stop when there's no remainder, or the value is repeating
  while(rem[val] == 0 && val != 0)
    # keep track of the position of a value
    rem[val] = pos
    val *= 10
    val %= i
    pos += 1
  end
  
  # see if it is the biggest so far
  if pos - rem[val] > best_rep
    best_num = i
    best_rep = pos - rem[val]
  end
end

puts "#{best_num}: #{best_rep}"