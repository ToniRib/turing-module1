require 'pry'

data = [
  ['Frank', 33],
  ['Stacy', 15],
  ['Juan', 24],
  ['Dom', 32],
  ['Steve', 24],
  ['Jill', 24]
]

# Level 1: Write code that'll output the names (and only the names) in order by ascending age
puts 'Level 1:'
data.sort_by { |name, age| age }.each { |person| puts person[0] }
puts ""

# Level 2: Output the name with the age, like Juan (24)
puts 'Level 2:'
data.sort_by { |name, age| age }.each { |person| puts "#{person[0]} (#{person[1]})" }
puts ""

# Level 3: If there are multiple people tied with the same age, put them in alphabetical order
puts 'Level 3:'
data.sort_by { |n, a| [a, n] }.each { |person| puts "#{person[0]} (#{person[1]})" }
puts ""

# Level 4: Write code to automatically build a hash with the age as the key and an array of names as the value (all the people who are that age). e.g. {24 => ['Juan', 'Steve', 'Jill']...}
puts 'Level 4:'
hash = {}
data.each do |person|
  if hash.include?(person[1])
    hash[person[1]] << person[0]
  else
    hash[person[1]] = [person[0]]
  end
end
p hash
