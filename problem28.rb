size = 1001

def print_grid(grid)
  grid.each do |row|
    row.each do |element|
      print "%05d " % element
    end
    puts
  end
end

grid = [0] * size

# fill in the grid
0.upto(size-1) do |i|
  grid[i] = [0] * size
end

#print_grid(grid)

x = size / 2
y = x

puts "x: #{x}, y: #{y}"

step = 1

# sequence: +x, +y, -x, -y
operation = 0

num = 1
count = 0
loop do
  #puts "x: #{x}, y: #{y}, step: #{step} count: #{count}, operation: #{operation}"
  grid[y][x] = num
  
  num += 1
  count += 1
  
  case operation
  when 0  then  x += 1
  when 1  then  y += 1
  when 2  then  x -= 1
  when 3  then  y -= 1
  end
  
  if count == step
    if operation % 2 == 1
      step += 1
    end
    
    operation = (operation + 1) % 4
    count = 0
  end
  
  break if x == size && y == 0
end


#print_grid(grid)


# calculate the diagonals
a = 0
b = size - 1

total = 0
grid.each do |line|
  total += line[a]
  unless a == b
    total += line[b]
  end
  
  a += 1
  b -= 1
end

puts "total: #{total}"