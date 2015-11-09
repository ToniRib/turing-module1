require 'pry'

File.open('customers.csv').each do |line|
  puts line if line.split(',')[2].start_with?('N')
end
