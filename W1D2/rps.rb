def rps(my_choice)
    
  computer_choice = ["Rock", "Paper", "Scissors"].sample
  victories = [ ["Rock", "Scissors"], ["Scissors", "Paper"], ["Paper", "Rock"] ]
  
  if victories.include?([my_choice, computer_choice])
    "#{computer_choice}, Win"
  elsif my_choice == computer_choice
    "#{computer_choice}, Draw"
  else
    "#{computer_choice}, Lose"
  end
  
end