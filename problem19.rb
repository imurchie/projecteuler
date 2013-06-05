
month_names = %w{January February March April May June July August September October November December}
months      = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
leap_months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
days = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}

sundays = []

start = 1 # tuesday

1901.upto(2000) do |year|
  months_of_year = months
  # check to see if leap year
  if year % 4 == 0 || year % 400 == 0
    months_of_year = leap_months
    puts "Leap year: #{year}"
  end
    
  months_of_year.each_with_index do |month, index|
    if start == 6
      sundays << "#{month_names[index]} #{year}"
    end

    offset = month % 7
    start = (start + offset) % 7
  end
end

puts "Sundays: #{sundays.join(", ")}"
puts sundays.length