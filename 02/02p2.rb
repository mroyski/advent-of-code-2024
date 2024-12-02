# lines = File.readlines('sampleinput.txt')
lines = File.readlines('input.txt')

def check_if_safe(levels)
  increasing = levels[1] > levels[0]
  for i in 1...levels.length
    difference = levels[i] - levels[i - 1]
    return false if (increasing && difference <= 0) || (!increasing && difference >= 0) || difference.abs > 3
  end
  true
end

total_safe = 0

lines.each do |line|
  levels = line.split.map(&:to_i)

  if check_if_safe(levels)
    total_safe += 1
    next
  end

  is_safe_with_removal = false
  levels.each_index do |i|
    modified_levels = levels[0...i] + levels[i+1..-1]
    if check_if_safe(modified_levels)
      is_safe_with_removal = true
      break
    end
  end

  total_safe += 1 if is_safe_with_removal
end

puts total_safe
# 665