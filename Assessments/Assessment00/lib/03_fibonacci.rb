def fibs(num)
    if num == 1
        answer = [0]
    elsif num == 2
        answer = [0,1]
    else
        rounds = num - 2

        rounds.times do
            answer<<(answer[-2] + answer[-1])
        end
        
    end
    
puts answer

end