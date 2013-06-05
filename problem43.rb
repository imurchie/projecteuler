


def get_slice(num, start, length)
  num.to_s.slice(start, length).to_i
end

def count?(num)
  divisors = [2, 3, 5, 7, 11, 13, 17]
  
  1.upto(7) do |i|
    return false if get_slice(num, i, 3) % divisors[i-1] != 0
  end
  
  true
end


digits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

perms = digits.permutation.to_a

values = []

perms.each do |i|
  i = i.join("").to_i
  
  values << i if count?(i)
end

puts "sum: #{values.length}: #{values.inject(:+)}"