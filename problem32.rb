digits = [1, 2, 3, 4, 5, 6, 7, 8, 9]

combinations = digits.permutation.to_a

products = [0]

combinations.each do |c|
  c_str = c.join("")
  
  0.upto(8) do |i|
    7.downto(i) do |j|
      op1   = c_str[0..i].to_i
      op2   = c_str[i+1..j].to_i
      prod  = c_str[j+1..-1].to_i
        
      #puts "#{c_str}: #{op1}, #{op2}, #{prod}"
      if op1 * op2 == prod
        puts "#{c_str}: #{op1}, #{op2}, #{prod}"
        products << prod
      end
    end
  end
end

products_unique = products.uniq
puts "\nproducts: #{products.length} (unique: #{products_unique.length}); sum: #{products_unique.inject(:+)}"