# lines = File.readlines('sampleinput.txt')
lines = File.readlines('input.txt')

total_safe = 0
lines.each do |line|
  levels = line.split.map(&:to_i)
  safe = false
  increasing = levels[1] > levels[0]


  for i in 1...levels.length
    difference = levels[i] - levels[i - 1]

    break if increasing && difference <= 0
    break if !increasing && difference >= 0
    break if difference.abs > 3

    safe = true if i == levels.length - 1
  end

  if safe
    total_safe += 1
    puts "safe: #{levels.join}"
  end
end

puts total_safe