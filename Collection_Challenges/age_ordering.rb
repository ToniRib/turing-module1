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
data.sort_by { |name, age| age }.each { |person| puts person[0] }

# Level 2: Output the name with the age, like Juan (24)
data.sort_by { |name, age| age }.each { |person| puts "#{person[0]} (#{person[1]})" }

# Level 3: If there are multiple people tied with the same age, put them in alphabetical order
age_sorted = data.sort_by { |name, age| age }
new_array = []
age_sorted.each_with_index do |person, idx|
  # binding.pry
  if age_sorted.select { |_, age| age == person[1] }.count > 1
    new_array << age_sorted.select { |_, age| age == person[1] } && ! new_array.include?(person)
  else
    new_array << person
  end
end

p new_array

# Level 4: Write code to automatically build a hash with the age as the key and an array of names as the value (all the people who are that age). e.g. {24 => ['Juan', 'Steve', 'Jill']...}
