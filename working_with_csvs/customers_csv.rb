require 'csv'

options = { headers: true, header_converters: :symbol }

CSV.open('customers.csv', options).each do |line|
  puts line if line[:last_name].start_with?('N')
end
