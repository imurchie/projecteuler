

smallest = 20

def mult?(num)
  (1..20).each do |i|
    return false if num % i != 0
  end
  true
end

while true
  break if mult?(smallest)
  smallest += 20
end

p smallest