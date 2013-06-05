



palindromes = []

num = 1_000_000

num.times do |i|
  i_str = i.to_s
  
  if i_str == i_str.reverse
    # this is a palindrome decimally
    i_str_b = "#{"%b" % i}"
    
    if i_str_b == i_str_b.reverse
      # this is a palindrome binarily
      palindromes << i
    end
  end
end


puts "sum: #{palindromes.inject(:+)}"