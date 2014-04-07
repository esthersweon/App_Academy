def two_sum(array)
    answer = []

    array[0..-2].each_with_index do |first_num, first_index|
      array[first_index + 1..-1].each_with_index do |second_num, second_index|
        answer << [first_index, second_index + first_index + 1] if first_num + second_num == 0
      end
    end

    answer
end