class Fixnum
  @@SINGLE_NUMBERS = [
    "",         # padding, so the index of "one" is 1, etc.
    "one", 
    "two", 
    "three", 
    "four", 
    "five", 
    "six", 
    "seven", 
    "eight", 
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen"
  ]
  
  @@TENS = [
    "",
    "",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety"
  ]
  
  @@BIG_NUMBERS = [
    "thousand",
    "million",
    "billion",
    "trillion"
  ]
  
  
  
  def in_words
    string_array = []
    i = self    # temporary number, so we can change it as we analyze
    
    # zero screws the logic up, so we'll get it over with here
    return "zero" if i == 0
    
    # everything repeats at the level of thousands
    suffix = 0
    while i > 0
      rem = i % 100
      # first the oddities in the first 19
      if rem < 20 && rem >= 10
        string_array << @@SINGLE_NUMBERS[rem]
      else
        string_array << @@SINGLE_NUMBERS[i%10]
      end
      
      # now do 20-90
      if rem/10 > 1
        string_array << @@TENS[rem/10]
      end
      
      # now do the hundreds
      rem = i % 1000
      if rem / 100 != 0
        string_array << "and" unless string_array.length == 1 && string_array[0] == ""
        string_array << "hundred"
        string_array << @@SINGLE_NUMBERS[rem / 100]
      end
      
      # cut the number down by 1000
      i /= 1000
      
      # we will need a suffix ("thousand", etc) when there
      # is some number in the next set of 1000 numbers
      if i > 0 && i % 1000 != 0
        string_array << @@BIG_NUMBERS[suffix]
      end
      suffix += 1
    end
      
    # put it in the right order, and get rid of cruft
    string_array.reverse.select{ |word| word && word.length > 0 }.join(" ")
  end
end


count = 0
1.upto(1000) do |i|
  str = i.in_words
  p str
  count += str.gsub(/\W/, "").length
end

p count