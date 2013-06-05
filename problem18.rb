
#  75
#  95 64
#  17 47 82
#  18 35 87 10
#  20 04 82 47 65
#  19 01 23 75 03 34
#  88 02 77 73 07 63 67
#  99 65 04 28 06 16 70 92
#  41 41 26 56 83 40 80 70 33
#  41 48 72 33 47 32 37 16 94 29
#  53 71 44 65 25 43 91 52 97 51 14
#  70 11 33 28 77 73 17 78 39 68 17 57
#  91 71 52 38 17 14 91 43 58 50 27 29 48
#  63 66 04 68 89 53 67 30 73 16 69 87 40 31
#  04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

$triangle = [
  %w{00 00 00 00 00 00 00 00 00 00 00 00 00 00 75 00 00 00 00 00 00 00 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 00 00 00 00 00 00 00 95 00 64 00 00 00 00 00 00 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 00 00 00 00 00 00 17 00 47 00 82 00 00 00 00 00 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 00 00 00 00 00 18 00 35 00 87 00 10 00 00 00 00 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 00 00 00 00 20 00 04 00 82 00 47 00 65 00 00 00 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 00 00 00 19 00 01 00 23 00 75 00 03 00 34 00 00 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 00 00 88 00 02 00 77 00 73 00 07 00 63 00 67 00 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 00 99 00 65 00 04 00 28 00 06 00 16 00 70 00 92 00 00 00 00 00 00 00},
  %w{00 00 00 00 00 00 41 00 41 00 26 00 56 00 83 00 40 00 80 00 70 00 33 00 00 00 00 00 00},
  %w{00 00 00 00 00 41 00 48 00 72 00 33 00 47 00 32 00 37 00 16 00 94 00 29 00 00 00 00 00},
  %w{00 00 00 00 53 00 71 00 44 00 65 00 25 00 43 00 91 00 52 00 97 00 51 00 14 00 00 00 00},
  %w{00 00 00 70 00 11 00 33 00 28 00 77 00 73 00 17 00 78 00 39 00 68 00 17 00 57 00 00 00},
  %w{00 00 91 00 71 00 52 00 38 00 17 00 14 00 91 00 43 00 58 00 50 00 27 00 29 00 48 00 00},
  %w{00 63 00 66 00 04 00 68 00 89 00 53 00 67 00 30 00 73 00 16 00 69 00 87 00 40 00 31 00},
  %w{04 00 62 00 98 00 27 00 23 00 09 00 70 00 98 00 73 00 93 00 38 00 53 00 60 00 04 00 23}
]

$triangle2 = [
  %w{0 0 0 3 0 0 0},
  %w{0 0 7 0 4 0 0},
  %w{0 2 0 4 0 6 0},
  %w{8 0 5 0 9 0 3}
]

$path_totals = []

def paths(total = 0, row = 0, element = 14)
  #p total
  # check if we are in the last row
  if row == $triangle.length - 1
    $path_totals << (total + $triangle[row][element])
    return
  end
  
  # now call on the next row
  paths(total + $triangle[row][element], row+1, element-1)
  paths(total + $triangle[row][element], row+1, element+1)
end


# make into array of array of ints
$triangle = $triangle.map do |line|
  line.map { |element| element.to_i }
end

# the top of the triangle is at element 14
start = 14
paths(0, 0, 14)

p $path_totals.max