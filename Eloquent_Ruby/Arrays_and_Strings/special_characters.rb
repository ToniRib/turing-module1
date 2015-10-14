# Q: What does it mean to "escape" a character within a string?
# A: It means that you add a backslash before that character so the interpreter
#    generates the actual character instead of ending the string or interpreting
#    it in some other way.

# Q: List 3 characters that have to be "escaped" when written in a string.
# A: 1) a single quote (in a single quoted string)
#    2) a backslash
#    3) a double quote (in a double quoted string)
puts 'I\'m leaning to program'
puts 'This is a \\ backslash'
puts "Did you say, \"wait?\""

# Use escape strings to generate a string containing your name and,
# on a separate line, your height in inches and feet
puts %q(Toni
5'10")
