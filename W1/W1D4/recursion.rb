def range(start, end_num)
  array = []
  if start == end_num
    array << end_num
  else
   array << start
   array + range(start + 1, end_num)
  end
end

# p range(1, 10)

class Array
  def r_sum
    if self.count == 1
      self.first
    else
      self.pop + self.r_sum
    end
  end

  def i_sum
    self.inject(:+)
  end

  def deep_dup
    self.map do |value_being_copied|
      if value_being_copied.is_a?Array
        value_being_copied.deep_dup
      else
        value_being_copied
      end
    end
  end

  def subsets
    if self.count == 0
      [[]]
    else
      subs = self.take(count - 1).subsets
      subs + subs.map { |sub| sub + [last] }
    end
  end
end
#
# p [].subsets
# p [1].subsets
# p [1,2].subsets

# a = [1,[2,3,["4",5]],6]
# b = a.deep_dup
# p b
# p a.object_id
# p b.object_id

# p [1, 2, 3].r_sum #Fix destructive nature of solution
# p [1, 2, 3].i_sum
#
# puts ""

def exp_r1 (base, exponent)
  if exponent == 0
    return 1
  else
    base * exp_r1(base, exponent - 1)
  end
end

def exp_r2 (base, exponent)
  if exponent == 0
    return 1
  elsif exponent % 2 == 0
    exp_r2(base, exponent / 2) ** 2
  else
    base * (exp_r2(base, (exponent - 1) / 2) ** 2)
  end
end

# p exp_r1(5, 0)
# p exp_r1(5, 1)
# p exp_r1(5, 2)
#
# p exp_r2(5, 0)
# p exp_r2(5, 1)
# p exp_r2(5, 2)

def fibonacci_i(n)
  answer = []
  (0..n).each do |element|
    if answer.length == 0
      answer<<0
    elsif answer.length == 1
      answer<<1
    else
      answer<< answer[-2] + answer[-1]
    end
  end
  answer
end

def fibonacci_r(num)
  if num == 0
    return [0]
  elsif num == 1
    return fibonacci_r(num-1) + [1]
  else
    array = fibonacci_r(num-1)
    return array + [array[-2] + array[- 1]]
  end
end

# p fibonacci_r(0)
# p fibonacci_r(1)
# p fibonacci_r(6)
# puts ""
#
# p fibonacci_i(0)
# p fibonacci_i(1)
# p fibonacci_i(6)

def binary_search(array, target)
  current_index = array.count/2
  current_value = array[array.count/2]

  if current_value == target
    current_index
  elsif array.size == 1
    nil
  elsif target < current_value
    binary_search(array[0..array.count/2 - 1], target)
  else
      new_index = binary_search(array[array.count/2..-1], target)
    if new_index.nil?     # because final current_value is not the target
      return nil
    else
      current_index += new_index if new_index.nil?
    end
  end
end

# a = [1, 3, 14, 5, 7, 9, 10, 11, 12, 13, 15]
# puts binary_search(a, 14)

def make_change(amount, coins = [25, 10, 5, 1])
  coins = coins.sort.reverse

  return [] if coins.empty? || amount < coins.last

  best_change = nil

  coins.each_with_index do |coin, index|
    next if coin > amount

    remainder = amount - coin

    best_remainder = make_change(remainder, coins[index..-1])

    this_change = [coin] + best_remainder

    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end

p make_change(24)
p make_change(39)
p make_change(14, [10, 7, 1]) #

def merge_sort(array)
  return array if array.length <= 1

  merge(merge_sort(array[0...array.count/2]), #Non inclusive ...
  merge_sort(array[array.count/2..-1])) #To avoid out of bounds error
end


def merge(a, b)
  results = []
  while (a.count > 0 || b.count > 0)
    if a.count > 0 && b.count > 0
      if a.first <= b.first
        results << a.first
        a = a.drop(1)
      else
        results << b.first
        b = b.drop(1)
      end
    elsif a.count > 0
      results << a.first
      a = a.drop(1)
    else
      results << b.first
      b = b.drop(1)
    end
  end
  results
end

p merge_sort([1])
p merge_sort([2,1])
p merge_sort([3,2,1])
p merge_sort([4,3,2,1])
p merge_sort([3,2,7,4,15,11])
p merge_sort([3,2,7,4,15,-11])
p merge_sort([3,2,7,4,15,1,11])
p merge_sort([3,0,7,4,15,11])
p merge_sort([3,0,7,0,15,11])
p merge_sort([3,1,4,15,0])