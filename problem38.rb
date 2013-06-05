
def pandigital?(n)
  digits = n.to_s.split("").map { |i| i.to_i }.sort
  
  return false if digits.length != 9
  
  digits.each_with_index do |element, index|
    return false if element != index+1
  end
end




highest = 0

9000.upto(10000) do |i|
  arr = []
  
  #puts "#{i}"
  
  j = 1
  loop do
    mult = arr.join("")
    
    break if mult.length >= 9
    
    #puts "  #{j}: #{i * j}"
    
    arr << i * j
    
    #puts "    #{arr.join("")} (#{arr.join("").length})"
    
    j += 1
  end
  
  mult = arr.join("")
  if mult.length == 9
    int = mult.to_i
    
    # check against highest first so we don't need to process pandigital
    if int > highest && pandigital?(int)
      highest = int
    end
  end
end




puts "max: #{highest}"