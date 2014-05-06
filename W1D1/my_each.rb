class Array
    def my_each(&prc)
        self.count.times { |i| prc.call(self[i]) }
        self
    end
end

[1, 2, 3].my_each{ |x| puts x * x}
