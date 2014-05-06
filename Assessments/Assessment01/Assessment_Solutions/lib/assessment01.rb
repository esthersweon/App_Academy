# 19/19
def factors(num)
	answer = []
	(1..num).each do |fac|
    # TA: spaces around operators answer << fac
		answer << fac if num % fac == 0
	end
	answer
end

def fibs_rec(count)
	if count == 1
		return [0]
        elsif count == 2 # TA: wonky spacing
		return [0, 1]
        else
		array = fibs_rec(count-1)
    # TA: when returning the last line, just use the implicit return (no return keyword)
		 array + [array[-2] + array[-1]]
	end
end

# TA: this class has some wokny spacing. use 2 spaces to indent
class Array
    def bubble_sort(&prc)
        self.dup.bubble_sort!(&prc)
    end

    def bubble_sort!(&prc)
        prc = Proc.new {|x,y| x <=> y} unless prc != nil
        return [] if length == 0
        return self if length == 1
        sorted = false

        until sorted
            sorted = true

            length.times do |i|
                next if i >= count
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self
    end
end

p [5, 4, 3, 2, 1].bubble_sort()

class Array
    def two_sum
        answer = []
        self.each_with_index do |value, index|
            self[index+1..-1].each_with_index do |value2, index2|
                answer << [index, index2 + index + 1] if value + value2 == 0
            end
        end
        answer
    end
end

class String
    def subword_counts(dictionary)
        subwords = []
        # TA: cool this could have just as easily be don with Hash.new(0)
        # as 0 is immutable.
        answer = Hash.new {|hash, key| hash[key] = 0}
        (0..length-1).each do |start|
            (0..length-start-1).each do |len|
                # TA: this line is too long
                if dictionary.include?(self[start..len + start])
                    subwords << self[start..start + len]
                    end 
            end
        end

        subwords.each do |subw|
            answer[subw] += 1
        end

        answer
    end
end
