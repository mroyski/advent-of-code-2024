# lines = File.readlines('sampleinput.txt')
lines = File.readlines('input.txt')

def sorted_insert(number, arr)
  if arr.length == 0
    arr.push(number)
    return
  end

  index = 0
  while !arr[index].nil? && number > arr[index]
    index += 1
  end

  arr.insert(index, number)
end


left_arr = []
right_arr = []

lines.each do |line|
  split_lines = line.split
  left_number = split_lines[0].to_i
  right_number = split_lines[-1].to_i

  sorted_insert(left_number, left_arr)
  sorted_insert(right_number, right_arr)
end

diffs = 0
index = 0
while index < left_arr.length do
  diffs += (left_arr[index] - right_arr[index]).abs
  index += 1
end

puts diffs
# 765748