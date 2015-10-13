require 'pry'

TRANSLATE = { 3 => 'Fizz',
              5 => 'Buzz',
              7 => 'Super' }

keys = TRANSLATE.keys

(0..1000).to_a.each do |n|
  vals = keys.select { |k| n % k == 0 }
  if vals.length == 3
    puts 'SuperFizzBuzz'
  elsif vals.include?(3) && vals.include?(7)
    puts 'SuperFizz'
  elsif vals.include?(5) && vals.include?(7)
    puts 'SuperBuzz'
  elsif vals.length == 1
    puts TRANSLATE.fetch(vals.first)
  else
    puts n
  end
end
