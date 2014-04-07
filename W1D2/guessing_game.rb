def guessing_game
  comp_choice = rand(1..100)
  guesses = 0

  loop do
    puts "What is your guess?"
    guess = gets.chomp.to_i

    if guess > comp_choice
      puts "Your answer is too high."
    elsif guess < comp_choice
      puts "Your answer is too low."
    else
      puts "Congratulations!"
      break
    end

    guesses += 1
  end
  
  puts "You have guessed correctly after #{guesses} wrong guesses."
end

guessing_game