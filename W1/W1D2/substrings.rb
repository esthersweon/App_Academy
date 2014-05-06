def substrings(str)
    answer = []
    
    str.length.times do |start_index|
        [start_index + 1..str.length].each do |end_index|
            sub = str[start_index..end_index]
            answer << sub unless answer.include?(sub)
        end
    end
    
    answer
end
