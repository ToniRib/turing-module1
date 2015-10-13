# How can I tell how many characters are in a string? Do spaces count?
# Answer: spaces do count, see below
puts "abcde".length
puts "ab   cde".length

# How can I capitalize the first character of a string? What happens if it is a number?
puts "toni".capitalize
puts "8toni".capitalize # does nothing to the 8, does not capitalize the t

# How can I turn a string backwards?
puts "toni".reverse

# How can I tell if two words have the same number of characters?
puts "toni".length == "home".length
puts "toni".length == "daniel".length

# How can I tell if a word has all capital letters?
str = "helLO"
puts str.eql?(str.upcase) # false
str = "HELLO"
puts str.eql?(str.upcase) #true

# How can I tell if a word has all lower case letters?
str = "helLO"
puts str.eql?(str.downcase) # false
str = "hello"
puts str.eql?(str.downcase) #true

# How can I tell if a word is a palindrome? (The word is the same forwards and backwards.)
puts "elle" == "elle".reverse # true
puts "elm" == "elm".reverse # false

# How can I tell if a sentence is the same forwards and backwards?
puts "sore was I ere I saw eros" == "sore was I ere I saw eros".reverse # true

# How can I replace an occurrence of a single character in a string with another character?
puts "toni".sub("n", "r")

# How can I replace ALL occurrences of a single character in a string with another character?
puts "hello".gsub("l", "m")

# How do I insert 5 asterisks at the start of a string? What about at the end of a string? What about x asterisks?
puts "hello".prepend("*"*5)
puts "hello" + "*" * 5
x = 25
puts "hello" + "*" * x

# What if I wanted to have a string that's four characters long, but I want to make a big string thats 14 characters in length, with the original string in the middle, with asterisks on either side of the original string to make it reach the desired length?
puts "four".center(14, "*")

# What if I wanted to replace the padding character with spaces? And a variable total length?
x = 40
puts "four".center(x, " ")

# What are two ways in which you can determine if an integer is odd? (Or even.)
puts 1.odd? # true
puts 2.even? # true
puts 3 % 2 == 0 # false
puts 4 % 2 == 0 # true

# How can I convert a string into a number?
puts "123".to_i
puts "123.3".to_f

# How can you tell if a number is a palindrome? (303, 1221, 123321)
# Answer: convert it to a string then compare
puts 303.to_s == 303.to_s.reverse # true
puts 123.to_s == 123.to_s.reverse # false

# How can you tell if a number is divisible by 3? By 9? By x?
puts 9 % 3 == 0 # true
puts 10 % 3 == 0 # false
puts 18 % 9 == 0 # true
puts 20 % 9 == 0 # false
x = 24
puts 25 % x == 0 # false
puts 48 % x == 0 # true
