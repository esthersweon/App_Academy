class Array
  def my_uniq
    new_arr = []
    self.each do |el|
      new_arr << el if !new_arr.include?(el)
    end
    new_arr
  end

  def two_sum
    arr = []
    (0...(self.length - 1)).each do |index_start|
      ((index_start + 1)...self.length).each do |index_end|
        arr << [index_start, index_end] if self[index_start] + self[index_end] == 0
      end
    end
    arr
  end

end

def my_transpose(arr)
  new_arr = Array.new(arr.length) { Array.new(arr.length) }
  arr.length.times do |idx1|
    arr[idx1].length.times do |idx2|
      new_arr[idx2][idx1] = arr[idx1][idx2]
    end
  end
  new_arr
end

def stock_picker(arr)
  max = 0
  buy_idx, sell_idx = 0, 0
  (0...arr.length).each do |idx1|
    ((idx1+1)...arr.length).each do |idx2|
      if (arr[idx2] - arr[idx1]) > max
        max = arr[idx2] - arr[idx1]
        buy_idx, sell_idx = idx1, idx2 + idx1
      end
    end
  end
  return buy_idx, sell_idx
end
