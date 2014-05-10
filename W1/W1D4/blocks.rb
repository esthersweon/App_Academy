class Array
  def my_each (&blk)
    index = 0
    while index < self.count
      blk.call(self[index])
      index += 1
    end

    self
  end

  def my_map (&blk)
    array = []
    index = 0
    while index < self.count
      array << blk.call(self[index])
      index += 1
    end

    array
  end

  def my_select (&blk)
    array = []
    index = 0
    while index < self.count
      array << self[index] if blk.call(self[index])
      index += 1
    end

    array
  end

  def my_inject (start = 0, &blk)
    index = 1
    variable = self[0]
    while index < self.count
      variable = blk.call(variable, self[index])
      index += 1
    end
    variable
  end

  def my_sort! (&blk)
    sorted = false
    until sorted
      sorted = true

      self.each_index do |index|
        next if (index + 1) == self.count
        if blk.call(self[index], self[index+1]) > 0
          self[index], self[index+1] = self[index+1], self[index]
          sorted = false
        end
        index += 1
      end

    end
    self
  end

end

def eval_block(*args, &blk)
  if blk
    blk.call(*args)
  else
    puts "NO BLOCK GIVEN"
  end
end




# Random tests
["one", "two", "three"].my_each { |string| puts string }

p ["one", "two", "three"].my_map { |string| string * 2 }

p ["one", "two", "three"].my_select { |string| string.length <= 3}

# Inject test
p [1, 2, 3].my_inject { |sum, value| sum + value }  # 6

# Sort! test
p [3, 2, 1].my_sort! { |num1, num2| num1 <=> num2 } #sort ascending
p [1, 2, 3].my_sort! { |num1, num2| num2 <=> num1 } #sort descending

# Eval_block test
p eval_block(1, 2, 3) {|num1, num2, num3| puts "#{num1} #{num2} #{num3}"}
p eval_block(1, 2, 3)

