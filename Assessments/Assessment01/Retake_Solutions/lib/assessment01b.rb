def fibs_iter(n)
  if n == 1
    fibs = [0]
  else
    fibs = [0, 1]

    (n - 2).times do
      fibs << fibs[-2] + fibs[-1]
    end
  end

  fibs
end

def sum_rec(nums)
  return 0 if nums.empty?
  nums[0] + sum_rec(nums[1..-1])
end

class Array
  def binary_search(target)
    return nil if count == 0

    midpoint = length / 2
    case target <=> self[midpoint]
    when -1
      self[0...midpoint].binary_search(target)
    when 0
      midpoint
    when 1
      subproblem_answer = self[(midpoint + 1)..-1].binary_search(target)
      (subproblem_answer.nil?) ? nil : (midpoint + 1) + subproblem_answer
    end
  end
end

class String
  def uniq_subs
    subs = {}

    length.times do |i|
      (i...length).each do |j|
        subs[self[i..j]] = true
      end
    end

    subs.keys
  end
end

class Array
  def merge_sort
    return self if count < 2
    middle = count / 2
    left, right = self[0...middle], self[middle..-1]

    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << ((left.first < right.first) ? (left.shift) : (right.shift))
    end
    merged_array + left + right
  end
end
