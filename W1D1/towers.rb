
def towers
  array = [[3, 2, 1], [], []]

  while array[2].count < 3 do
    print "Your current status: "
    print array
    puts

    puts "Where from?"
    user_from = gets.chomp.to_i
    puts "Where to?"
    user_to = gets.chomp.to_i

    array = check_disc(user_from - 1, user_to - 1, array)
  end

  puts "You won!"
end


def check_disc(user_from, user_to, array)

  if user_from >= 3 || user_to >= 3
    puts "This pile does not exist."
  elsif array[user_from].empty?
    puts "There is nothing to move in this stack."
  elsif array[user_to].empty?
    array[user_to] << array[user_from].pop
  elsif array[user_to].last == array[user_from].last
    puts "You cannot move to and from the same pile."
  elsif array[user_to].last > array[user_from].last
    array[user_to] << array[user_from].pop
  elsif array[user_to].last < array[user_from].last
    puts "You cannot move to this pile."
  end

  array
end