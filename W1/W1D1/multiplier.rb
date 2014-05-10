def multiplier(array)
  array.map! {|x| x * 2}
end

puts multiplier([1, 3, 5])