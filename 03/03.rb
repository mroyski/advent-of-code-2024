# input = File.read('sampleinput.txt')
input = File.read('input.txt')

# regex = /mul\(\d+,\d+\)/
regex = /mul\((\d+),(\d+)\)/

matches = input.scan(regex)

sum = 0

matches.each do |set|
  sum += set[0].to_i * set[1].to_i
end

puts sum
# 189600467