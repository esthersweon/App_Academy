def in_words(num)
  name = ''
  ones = %w[one two three four five six seven eight nine]
  teens = %w[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  tens = %w[ten twenty thirty forty fifty sixty seventy eighty ninety]

  iteration = [1_000_000_000_000, 1_000_000_000, 1_000_000, 1_000, 100]
  places = %w[trillion billion million thousand hundred]

  return 'zero' if num == 0

  i = 0
  left = num

  while i < 5 && left > 0
    if left / iteration[i] > 0
      name += in_words(left / iteration[i]) + places[i] + " "
      left = left % iteration[i]
    end
    i += 1
  end

  if left >= 20
    name += tens[ (left / 10) - 1] + " "
  end

  write = left / 10
  left = left % 10

  if left > 10 && left < 20
    name += teens[ (num / 10) - 1] + " "
  elsif left < 10 && left > 0
    name += ones[ (num % 10) - 1] + " "
  end

  name

end