letter_values = {
  "A" => 1,
  "B" => 2,
  "C" => 3,
  "D" => 4,
  "E" => 5,
  "F" => 6,
  "G" => 7,
  "H" => 8,
  "I" => 9,
  "J" => 10,
  "K" => 11,
  "L" => 12,
  "M" => 13,
  "N" => 14,
  "O" => 15,
  "P" => 16,
  "Q" => 17,
  "R" => 18,
  "S" => 19,
  "T" => 20,
  "U" => 21,
  "V" => 22,
  "W" => 23,
  "X" => 24,
  "Y" => 25,
  "Z" => 26
}

names = 0
File.open("names.txt") do |f|
  names = f.gets
end

names_arr = names.gsub(/\"/, "").split(",").sort!

total = 0
names_arr.each_with_index do |name, index|
  worth = name.split("").inject(0) { |w, l| w + letter_values[l] }
  total += worth * (index + 1)
end

puts total