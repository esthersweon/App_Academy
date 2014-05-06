class Array
    def bubble_sort!
        sorted = false
        until sorted
            sorted = true
            
            self.each_index do |index|
                next if (index + 1) == self.count
                if self[i] > self[i + 1]
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        
        self
    end
end