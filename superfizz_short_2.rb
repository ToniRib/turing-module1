0.upto(1000) do |n|
  str = ''
  str << 'Super' if n % 7 == 0
  str << 'Fizz' if n % 3 == 0
  str << 'Buzz' if n % 5 == 0
  puts str.empty? ? n : str
end
