def fibs_iter(n)
    answer = []
    (1..n).each do |el|
        if el == 1
            answer<<0
            elsif el == 2
            answer<<1
            else
            answer << (answer[el-2] + answer[el-3])
        end
    end
    answer
end

def sum_rec(nums)
    if nums.empty?
        0
        else
        nums.shift + sum_rec(nums)
    end
end

class Array
    def binary_search(target)
        self.sort!
        mid_idx = (self.length)/2
        if self.empty?
            nil
            elsif target == self[mid_idx]
            mid_idx
            elsif self.length == 1
            nil
            elsif target < self[mid_idx]
            self[0..mid_idx-1].binary_search(target)
            elsif target > self[mid_idx]
            prelim_answer = self[mid_idx+1..-1].binary_search(target)
            prelim_answer.nil? ? nil : prelim_answer + mid_idx + 1
        end
    end
end

p [1, 2, 3, 4, 5].binary_search(4)

class String
    def uniq_subs
        answer = []
        p str_array = self.split("")
        str_array.each_index do |start_idx|
            (0..str_array.length-start_idx).each do |end_idx|
                answer << str_array[start_idx..start_idx + end_idx].join("")
            end
        end
        answer.uniq!
    end
end

class Array
  def merge_sort
    return self if self.count <= 1
    midpt = count/2
    left = self[0..midpt-1]
    right = self[midpt..-1]
    
    sorted_left = left.merge_sort
    sorted_right = right.merge_sort
    
    merge(sorted_left, sorted_right)
  end
  
  def merge(left, right)
      results = []
      until left.empty? || right.empty?
          results << ((left.first < right.first) ? (left.shift) : (right.shift))
      end
      results + left + right
  end
  
end



[5, 4, 3, 2, 1].merge_sort






