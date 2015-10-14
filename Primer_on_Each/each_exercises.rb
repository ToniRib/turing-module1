require 'pry'

arr = [1, 2, 3, 4, 5, 6]

# If you had an array of numbers, e.g. [1,2,3,4], how do you print out
#  the doubles of each number? Triples?
puts 'Exercise 1'
puts 'doubles'
arr.each { |num| puts num * 2 }
puts 'triples'
arr.each { |num| puts num * 3 }
puts ''

# If you had the same array, how would you only print out
# the even numbers? What about the odd numbers?
puts 'Exercise 2'
puts 'evens'
arr.each do |num|
  puts num if num.even?
end
puts 'odds'
arr.each do |num|
  puts num if num.odd?
end
puts ''

# Given an array of first and last names,
# e.g. ["Alice Smith", "Bob Evans", "Roy Rogers"],
# how would you print out the full names line by line?
puts 'Exercise 3'
names = ['Alice Smith', 'Bob Evans', 'Roy Rogers', 'Toni Rib']
names.each { |name| puts name }
puts ''

# How would you print out only the first name?
puts 'Exercise 4'
names.each { |name| puts name.split.first }
puts ''

# How would you print out only the last name?
puts 'Exercise 5'
names.each { |name| puts name.split.last }
puts ''

# How could you print out only the initials?
puts 'Exercise 6'
names.each do |name|
  puts name.split.first[0] + name.split.last[0]
end
puts ''

# How can you print out the last name and how many characters are in it?
puts 'Exercise 7'
names.each do |name|
  puts "#{name.split.last} (#{name.split.last.length})"
end
