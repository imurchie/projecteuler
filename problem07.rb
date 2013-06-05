


def is_prime?(n)
  2.upto(n/2) { |i| return false if n % i == 0 }
  true
end




n = 2
count = 0
while true
  if is_prime?(n)
    count += 1
    p "#{count}: #{n}"
  end
  break if count == 10001
  n += 1
end


p n