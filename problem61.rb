

# the triangle formula produces 4 digits between 45 and 140
triangles = (45..140).inject([]) { |a, n| a << (n * (n + 1) / 2).to_i; a }

# squares between 32 to 100
squares = (32..100).inject([]) { |a, n| a << (n ** 2).to_i; a }

# 26 to 81
pentagonals = (26..81).inject([]) { |a, n| a << (n * (3.0 * n - 1) / 2).to_i; a }

# 23 to 71
hexagonals = (23..71).inject([]) { |a, n| a << (n * (2 * n - 1)).to_i; a }

# 21 to 63
heptagonals = (21..63).inject([]) { |a, n| a << (n * (5 * n - 3) / 2).to_i; a }

# 19 to 58
octagonals = (19..58).inject([]) { |a, n| a << (n * (3 * n - 2)).to_i; a }


# we need to find a minimal array over which to iterate
# no number with 0 in the tens position can be used, as it would create a three digit number to follow

array = triangles + squares + pentagonals + hexagonals + heptagonals + octagonals

array = array.uniq

array = array.select do |i|
  i % 100 >= 10
end


# going through all the permutations is too slow, and repeats the same test too many times
# creating an array of permutations is too unweidly and memory intensive
# therefore, need to go manually through the, and wittle down the possible cycles

array.each do |i|
  n1 = i % 100

  (array & ("#{n1}00".to_i.."#{n1}99".to_i).to_a).each do |j|
    n2 = j % 100
    
    (array & ("#{n2}00".to_i.."#{n2}99".to_i).to_a).each do |k|
      n3 = k % 100
      
      (array & ("#{n3}00".to_i.."#{n3}99".to_i).to_a).each do |l|
        n4 = l % 100
        
        (array & ("#{n4}00".to_i.."#{n4}99".to_i).to_a).each do |m|
          n5 = m % 100
          
          (array & ("#{n5}00".to_i.."#{n5}99".to_i).to_a).each do |n|
            n6 = n % 100
            
            if ("#{n6}00".to_i.."#{n6}99".to_i).to_a.include?(i)
              c = [i, j, k, l, m, n]
              
              # the polygonal versions do not need to be in any particular order
              c.permutation(6).each do |f|
                  if triangles.include?(f[0]) &&
                    squares.include?(f[1]) &&
                    pentagonals.include?(f[2]) &&
                    hexagonals.include?(f[3]) &&
                    heptagonals.include?(f[4]) &&
                    octagonals.include?(f[5])
                    puts "Array: #{f.inspect}"
                    puts "sum: #{f.inject(:+)}"
      
                    exit
                  end
                end
            end
          end
        end
      end
    end
  end
end
