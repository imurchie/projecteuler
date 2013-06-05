total = 200   # 2 pounds is 200 pence

TWO_POUND = 200
ONE_POUND = 100
FIFTY_P   = 50
TWENTY_P  = 20
TEN_P     = 10
FIVE_P    = 5
TWO_P     = 2
ONE_P     = 1


def do_one_pound(overall_remainder)
  (overall_remainder / 100).downto(0) do |one_pound|
    remainder = overall_remainder
    
    if one_pound * ONE_POUND <= remainder
      remainder -= one_pound * ONE_POUND
    end
    
    #puts "  #{one_pound} one pounds: #{remainder}"
    
    if remainder == 0
      $count += 1
    else
      do_fifty_p(remainder)
    end
  end
end

def do_fifty_p(overall_remainder)
  (overall_remainder / 50).downto(0) do |fifty_p|
    remainder = overall_remainder
    
    if fifty_p * FIFTY_P <= remainder
      remainder -= fifty_p * FIFTY_P
    end
    
    #puts "    #{fifty_p} fifty p: #{remainder}"
    
    if remainder == 0
      $count += 1
    else
      do_twenty_p(remainder)
    end
  end
end

def do_twenty_p(overall_remainder)
  (overall_remainder / 20).downto(0) do |twenty_p|
    remainder = overall_remainder
    
    if twenty_p * TWENTY_P <= remainder
      remainder -= twenty_p * TWENTY_P
    end
    
    #puts "      #{twenty_p} twenty_p: #{remainder}"
    
    if remainder == 0
      $count += 1
    else
      do_ten_p(remainder)
    end
  end
end

def do_ten_p(overall_remainder)
  (overall_remainder / 10).downto(0) do |ten_p|
    remainder = overall_remainder
    
    if ten_p * TEN_P <= remainder
      remainder -= ten_p * TEN_P
    end
    
    #puts "        #{ten_p} ten p: #{remainder}"
    
    if remainder == 0
      $count += 1
    else
      do_five_p(remainder)
    end
  end
end

def do_five_p(overall_remainder)
  (overall_remainder / 5).downto(0) do |five_p|
    remainder = overall_remainder
    
    if five_p * FIVE_P <= remainder
      remainder -= five_p * FIVE_P
    end
    
    #puts "          #{five_p} five p: #{remainder}"
    
    if remainder == 0
      $count += 1
    else
      do_two_p(remainder)
    end
  end
end

def do_two_p(overall_remainder)
  (overall_remainder / 2).downto(0) do |two_p|
    remainder = overall_remainder
    
    if two_p * TWO_P <= remainder
      remainder -= two_p * TWO_P
    end
    
    #puts "            #{two_p} two p: #{remainder}"
    
    if remainder == 0
      $count += 1
    else
      # one p will always create a path, filling up whatever remainder is there
      $count += 1
    end
  end
end



$count = 0

1.downto(0) do |two_pound|  # the most two pound units in two pounds is 1
  remainder = 200
  
  if two_pound * TWO_POUND <= remainder
    remainder -= two_pound * TWO_POUND
  end
  #puts "#{two_pound} two pounds: #{remainder}"
  if remainder == 0
    $count += 1
    next
  else
    do_one_pound(remainder)
  end
end


puts $count