require "mathn"

# By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
# 
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
# 
# Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

# want to return the order of magnitude
def order(n)
  o = 1
  while n > 10
    n /= 10
    o *= 10
  end
  
  return o
end

def try_digits(num)
  # keep track of the most primes we get
  max_count = 0
  
  min = order(num)
  max = min * 10
  
  digits = num.to_s.split("").map { |i| i.to_i }
  
  1.upto(digits.length-1) do |num_to_replace|
    # mask will allow us to substitute
    mask = [false] * digits.length
    digits.length.times { |i|  mask[i] = true if i < num_to_replace }
    possible_masks = mask.permutation.to_a.uniq
    
    # go through the possible masks
    possible_masks.each do |mask|
      # we only want to count this if the numbers are the same in the masked positions
      #cont = true
      #mask.each_with_index do |insert, index|
      #  if insert
      #    d ||= digits[index]
      #    cont = false if d != digits[index]
      #  end
      #end
      #next unless cont
      
      
      # keep track, for a particular number of replacements, of the primes we get
      family = []
      
      number = digits.clone # the number can be reused, since we replace the same digits
      
      # now go through the digits, 1-9, that we will try to insert
      0.upto(9) do |i|
        d_count = 0 # we need to make sure that the two numbers are the same
        mask.each_with_index do |insert, index|
          number[index] = i if insert
        end
        
        n = number.join("").to_i
        
        if n < min || n > max
          next
        end
        
        if Prime.prime?(n)
          family << n
        end
      end
      
      # we only want to include this range if the original number is part of it
      if family.include?(num)
        max_count = family.length if family.length > max_count
      end
    end
  end
  
  return max_count
end


#puts try_digits(120383)120383
#exit

Prime.each(1_000_000) do |p|
  puts p
  next if p < 120041
  
  if try_digits(p) == 8
    puts "First with 7: #{p}"
    break
  end
end