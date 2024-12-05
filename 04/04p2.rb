def find_x_mas(grid)
  rows = grid.size
  cols = grid[0].size
  count = 0

  for i in 1...(rows - 1)
    for j in 1...(cols - 1)
      if grid[i][j] == 'A'
        
        # Check the two diagonal patterns for "X-MAS" and "X-MAS" reversed
        # Top-left -> bottom-right diagonal
        if (grid[i-1][j-1] == 'M' && grid[i+1][j+1] == 'S') || (grid[i-1][j-1] == 'S' && grid[i+1][j+1] == 'M')

          # Top-right -> bottom-left diagonal
          if (grid[i-1][j+1] == 'M' && grid[i+1][j-1] == 'S') || (grid[i-1][j+1] == 'S' && grid[i+1][j-1] == 'M')
            count += 1
          end
        end
      end
    end
  end

  count
end

# input = File.readlines("sampleinput.txt")
input = File.readlines("input.txt")
puts find_x_mas(input)
# 1886
