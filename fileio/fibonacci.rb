# require 'pry'
#
# out = File.open('fib.txt', 'w')
#
# File.open('fib_orig.txt') do |f|
#   arr = []
#   f.each do |num|
#     if arr.length < 3
#       arr << num.chomp
#     else
#       # binding.pry
#       out.puts arr.join(', ')
#       arr = []
#     end
#   end
# end

# out.close

def fibonacci(n)
  arr = [0, 1]
  0.upto(n - 2) do |i|
    arr << arr[i] + arr[i + 1]
  end
  arr
end
