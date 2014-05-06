def finder(start)
  (start > 250 && start % 7 == 0) ? start : finder(start + 1)
end


# finder, version 2
#
# def finder
#   x = 250
#   loop do
#     break if x % 7 == 0
#     x+=1
#   end
#   x
# end
