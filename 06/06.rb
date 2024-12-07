start_time = Time.now

# input = File.readlines('sampleinput.txt')
input = File.readlines('input.txt')

position = nil
input.each_with_index do |line, index|
  if line.include?('^')
    position = [index, line.index('^')]
    break
  end
end

unique_positions = Set.new

puts 'start: ' + position.inspect

#                up     right   down    left
directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]
directions_index = 0
width = input[0].length
height = input.length
y = position[0]
x = position[1]

while y >= 0 && y < height && x >= 0 && x < width do
  unique_positions.add([y, x])

  next_y = y + directions[directions_index][0]
  next_x = x + directions[directions_index][1]

  if next_y < 0 || next_y >= height || next_x < 0 || next_x >= width
    break
  end

  while next_x && next_y && input[next_y][next_x] == '#' do
    directions_index += 1
    directions_index = 0 if directions_index >= directions.length

    next_y = y + directions[directions_index][0]
    next_x = x + directions[directions_index][1]
  end

  y = next_y
  x = next_x
end

puts unique_positions.length
# 4883

puts "Execution Time: #{Time.now - start_time}s"