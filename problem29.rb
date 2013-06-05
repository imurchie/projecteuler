#  a^b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?

sequence = []
2.upto(100) do |a|
  2.upto(100) do |b|
    sum = a ** b
    unless sequence.include?(sum)
      sequence << sum
    end
  end
end


puts sequence.length