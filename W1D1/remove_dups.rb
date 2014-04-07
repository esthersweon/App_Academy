def my_uniq(array)
    answer = []
    array.each do |element|
        answer << element unless answer.include?(element)
    end
    
    answer
end

puts [1, 2, 3, 3].my_uniq
