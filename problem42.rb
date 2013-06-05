$LETTER_HASH = {
  "A" =>  1,
  "B" =>  2,
  "C" =>  3,
  "D" =>  4,
  "E" =>  5,
  "F" =>  6,
  "G" =>  7,
  "H" =>  8,
  "I" =>  9,
  "J" =>  10,
  "K" =>  11,
  "L" =>  12,
  "M" =>  13,
  "N" =>  14,
  "O" =>  15,
  "P" =>  16,
  "Q" =>  17,
  "R" =>  18,
  "S" =>  19,
  "T" =>  20,
  "U" =>  21,
  "V" =>  22,
  "W" =>  23,
  "X" =>  24,
  "Y" =>  25,
  "Z" =>  26
}

# seed with first ten
$triangle_numbers = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]

def convert_word(word)
  word.each_char.inject(0) { |total, letter| total + $LETTER_HASH[letter] }
end

def is_triangle?(num)
  return $triangle_numbers.include?(num) if num <= $triangle_numbers[-1]
  
  # save the generated ones, so we don't need to regenerate
  while num > $triangle_numbers[-1]
    i = $triangle_numbers.length + 1
    n = (i / 2.0 * (i + 1)).to_i
    $triangle_numbers << n
    
    return true if num == n
  end
end

words = []
File.open("words.txt") do |f| 
  words = f.read.gsub(/\"/, "").split(",")
end

count = 0
words.each do |word|
  c_word = convert_word(word)
  if is_triangle?(c_word)
    #puts words
    count += 1
  end
end

puts "how many triangle words? #{count}"