def count_xmas(file_path)
  grid = File.readlines(file_path).map { |line| line.strip.chars }

  rows = grid.length
  cols = grid[0].length
  word = "XMAS"
  directions = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1],          [0, 1],
    [1, -1], [1, 0], [1, 1]
  ]

  count = 0

  (0...rows).each do |i|
    (0...cols).each do |j|
      next unless grid[i][j] == 'X'

      directions.each do |dx, dy|
        x, y = i, j
        match = true

        (1...word.length).each do |k|
          x += dx
          y += dy
          if x < 0 || x >= rows || y < 0 || y >= cols || grid[x][y] != word[k]
            match = false
            break
          end
        end

        count += 1 if match
      end
    end
  end

  count
end

# file_path = "sampleinput.txt"
file_path = "input.txt"
puts count_xmas(file_path)
# 2545
