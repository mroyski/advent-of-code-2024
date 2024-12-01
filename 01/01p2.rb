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
scores = Hash.new(0)

lines.each do |line|
  split_lines = line.split
  left_number = split_lines[0].to_i
  right_number = split_lines[-1].to_i

  sorted_insert(left_number, left_arr)
  sorted_insert(right_number, right_arr)

  scores[right_number] += 1
end

index = 0
score_total = 0
while index < left_arr.length do
  score = scores[left_arr[index]] * left_arr[index]
  score_total += score
  index += 1
end

puts score_total
# 27732508