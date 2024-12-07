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

# up, right, down, left
directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]
width = input[0].length
height = input.length
result = 0

for yindex in 0..height-1 do
  for xindex in 0..width-1 do
    if input[yindex][xindex] == '.'
      input[yindex][xindex] = '#'
    else
      next
    end

    unique_positions = Set.new
    y = position[0]
    x = position[1]
    directions_index = 0

    while y >= 0 && y < height && x >= 0 && x < width do
      if unique_positions.include?([y, x, directions_index])
        result += 1
        break
      end

      unique_positions.add([y, x, directions_index])


      next_y = y + directions[directions_index][0]
      next_x = x + directions[directions_index][1]

      if next_y < 0 || next_y >= height || next_x < 0 || next_x >= width
        break
      end

      turn_count = 0
      while turn_count < 4 && next_y >= 0 && next_y < height && next_x >= 0 && next_x < width && input[next_y][next_x] == '#' do
        directions_index += 1
        directions_index = 0 if directions_index >= directions.length

        next_y = y + directions[directions_index][0]
        next_x = x + directions[directions_index][1]

        turn_count += 1
      end

      break if turn_count > 4
      y = next_y
      x = next_x
    end

    puts "line: "
    puts input[yindex]
    input[yindex][xindex] = '.'

    puts "x: #{xindex}"
    puts "y: #{yindex}"
    puts 'positions:'
    puts unique_positions
  end
end

puts "result: #{result}"
puts "Execution Time: #{Time.now - start_time}s"

# LOL
# result: 1655
# Execution Time: 147.459339379s
