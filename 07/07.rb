# input = File.readlines('sampleinput.txt')
input = File.readlines('input.txt')

def evaluate_expression(numbers, operators)
  result = numbers[0]
  numbers.each_with_index do |num, i|
    next if i == 0
    result = result.send(operators[i - 1], num)
  end

  result
end

total_sum = 0

input.each do |line|
  test_value, numbers = line.split(': ')
  test_value = test_value.to_i
  numbers = numbers.split.map(&:to_i)

  operator_combinations = ['+', '*'].repeated_permutation(numbers.length - 1).to_a

  operator_combinations.each do |operators|
    result = evaluate_expression(numbers, operators)

    if result == test_value
      total_sum += test_value
      break
    end
  end
end

puts total_sum
# 42283209483350