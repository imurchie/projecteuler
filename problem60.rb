require "mathn"



# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
# 
# Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.

def get_set(primes, v)
  primes.select do |p|
    # if we do ones lower, we get lots of duplicates
    if p > v
      Prime.prime?("#{v}#{p}".to_i) && Prime.prime?("#{p}#{v}".to_i)
    end
  end
end


# going to try primes under 10000
# stipulation: get rid of 2 as it cannot be concatenated to anything and produce a prime.
primes = Prime.each(10000).to_a
primes -= [2]


candidates = []


# this solution creates a lot of repetition (each value in each position)
primes.each do |i|
  a2 = get_set(primes, i)
  #puts "a2: #{a2.inspect}"
  #puts "    #{a2.include?(i)}"
  a2.each do |j|
    a3 = get_set(a2, j)
    #puts "a3: #{a3.inspect}"
    #puts "    #{a3.include?(j)}"
    a3.each do |k|
      a4 = get_set(a3, k)
      a4.each do |l|
        a5 = get_set(a4, l)
        a5.each do |m|
          a = [i, j, k, l, m]
          candidates << a
          puts "Array: #{a.inspect}"
          puts "Sum: #{a.inject(:+)}"
        end
      end
    end
  end
end