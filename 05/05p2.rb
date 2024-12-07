# input = File.read('sampleinput.txt').gsub("\r\n", "\n") # Normalize line endings if on Windows
input = File.read('input.txt').gsub("\r\n", "\n") # Normalize line endings if on Windows

sections = input.split("\n\n")

rules = sections[0].split("\n")

updates = sections[1].split("\n").map { |line| line.split(',') }

rules_hash = {}
rules.each do |rule|
  lower = rule.split('|')[0]
  higher = rule.split('|')[1]
  
  if !rules_hash[lower]
    rules_hash[lower] = []
  end

  rules_hash[lower] << higher
end

sum = 0

updates.each_with_index do |update, index|
  valid = true

  for i in 0...update.length
    j = i + 1
    while j < update.length do
      if rules_hash[update[j]]&.include?(update[i])
        valid = false

        temp = update[i]
        update[i] = update[j]
        update[j] = temp
      end
      
      j += 1
    end
  end

  if !valid
    middle_page = update[(update.length / 2).floor]
    sum += middle_page.to_i
  end
end


puts sum
# 6370