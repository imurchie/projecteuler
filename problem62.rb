

# The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
# 
# Find the smallest cube for which exactly five permutations of its digits are cube.



# keep track of an array of permutations, keyed to the lowest permutation of the digits
permutations = {}

# it was way to slow to generate numbers and find cubes
# let's try to take numbers and get cubes
i = 340 # start with the high number from the problem itself
loop do
  i += 1
  
  n = i ** 3
  perm = n.to_s.split("").sort.join("")
  
  unless permutations[perm]
    permutations[perm] = []
  end
  
  permutations[perm] << n
  #puts "i: #{i}; n: #{n}; #{perm}: #{perms[perm].inspect}"
  
  # if there are five permutations for this particular permutation, end
  if permutations[perm].length == 5
    puts "Three perms! #{permutations[perm].inspect}"
    break
  end
end