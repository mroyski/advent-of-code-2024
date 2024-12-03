input = File.read('input.txt')

def valid_mul?(substring)
  match = substring.match(/^mul\((\d+),(\d+)\)$/)
  return match ? match.captures.map(&:to_i) : nil
end

i = 0
total = 0
process_mul = true

while i < input.length
  if input[i, 4] == "mul("

    closing_index = input.index(")", i)
    if closing_index
      substring = input[i..closing_index]
      result = valid_mul?(substring)
      if result && process_mul
        total += result[0] * result[1]
      end
      i += 4
      next
    end
  elsif input[i, 4] == "do()"
    process_mul = true
    i += 4
    next
  elsif input[i, 7] == "don't()"
    process_mul = false
    i += 7 
    next
  else
    i += 1
  end
end

puts total
# 107069718