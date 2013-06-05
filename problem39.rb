


highest_val = 0
highest_num = 0


0.upto(1000) do |p|
  ways = 0
  
  #puts "#{p}"
  
  1.upto(p) do |a|
    (1).upto(p-a) do |b|
      c = p - a - b
      
      if a ** 2 + b ** 2 == c ** 2
        ways += 1
        
        puts "#{p}: {#{a}, #{b}, #{c}} (pyth: #{a ** 2} + #{b ** 2} (#{a ** 2 + b ** 2}) == #{c ** 2})"
      end
      
      #(1).upto(p) do |c|
      #  next unless a + b + c == p
      #  
      #  
      #  
      #  if a ** 2 + b ** 2 == c ** 2
      #    ways += 1
      #    puts "#{p}: {#{a}, #{b}, #{c}} (pyth: #{a ** 2} + #{b ** 2} (#{a ** 2 + b ** 2}) == #{c ** 2})"
      #  end
      #end
    end
  end
  
  if ways / 2 > highest_num
    highest_num = ways / 2
    highest_val = p
  end
end


puts "highest value: #{highest_val}"
puts "highest number of values: #{highest_num}"