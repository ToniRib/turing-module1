animals = %w(dog cat goat capybara)
animals.map!(&:capitalize)
animals.join(', ')
