Shoes.app width: 300, height: 210 do
  @number = rand(1..10)

  background "#0fff87".."#3ca1ff"

  @para = para "Enter your guess:"

  flow margin: 15 do
    @edit = edit_line
    @push_me = button "OK"
  end

  stack do
    para 'Numbers you have guessed:'
    @guesses = para ""
  end

  keypress do |k|
    update_guesses if k == "\n"
  end

  @guessed_numbers = []

  @push_me.click do
    update_guesses
  end

  @play_again = button "play again?"

  @play_again.click do
    @number = rand(1..10)
    @para.replace "Enter your guess:"
    @guesses.replace ""
    @guessed_numbers = []
  end

  fill rgb(0, 0.6, 0.9, 0.1)
    stroke rgb(0, 0.6, 0.9)
    strokewidth 0.25

  20.times do
    oval(left:   (-5..self.width).rand,
         top:    (-5..self.height).rand,
         radius: (25..50).rand)
  end

  def update_guesses
    @guess = @edit.text.to_i
    @guessed_numbers << @guess
    @str = compare_guess(@guess, @number)
    @para.replace @str
    @guesses.replace @guessed_numbers.join(', ')
  end

  def compare_guess(guess, number)
    guess == number ? "You must be psychic!" : "You suck at guessing!"
  end
end
