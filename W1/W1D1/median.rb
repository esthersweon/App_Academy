def median(integers)
	
  sorted = integers.sort
  return sorted[sorted.length / 2] if sorted.count.odd?
  (sorted[sorted.length / 2] + sorted[sorted.length / 2 - 1]) / 2.0
end

puts median([1,2,3,4,5,6])

# version 2

def median(nums)
    sorted = nums.sort
    while sorted.count > 2
        sorted.shift
        sorted.pop
    end

    sorted.count == 1 ? sorted.first : ((sorted[0] + sorted[1]) / 2.0)
end