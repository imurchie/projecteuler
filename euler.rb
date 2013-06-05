module Euler
  def self.is_prime?(n)
    return false if n <= 1
  
    2.upto(Math::sqrt(n)) { |i| return false if n % i == 0 }
    true
  end
  
  def self.is_pandigital?(num, n=9)
    digits = num.to_s.split("").map { |i| i.to_i }.sort
  
    return false if digits.length != n
  
    1.upto(n) do |i|
      return false if digits[i-1] != i
    end
    
    true
  end
end
