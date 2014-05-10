def num_to_s(num, base)

    return "0" if num == 0

    digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]

    low_digit = num % base
    leftover = num - low_digit
  
    if leftover > 0
        num_to_s(leftover/base, base) + digits[low_digit]
    else
        digits[low_digit]
    end

end

puts num_to_s(234, 2)