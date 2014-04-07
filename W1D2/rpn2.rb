class rpn_2
    attr_accessor :stack
    
    def initialize
        @stack = [0]
    end
    
    def value
        return stack[stack.length-1]
    end
    
    def push(value)
        stack.push(value.to_f)
    end
    
    def plus
        stack.push(pop + pop)
    end
    
    def minus
        temp = pop
        stack.push(pop-temp)
    end
    
    def times
        stack.push(pop * pop)
    end
    
    def divide
        temp = pop
        stack.push (pop / temp)
    end
    
    def pop
        value = stack.pop
        raise "calculator is empty" if value.nil?
        return value
    end
    
    def tokens(string)
        string.split.map do |t|
            case t
                when '+', '-', '*', '/'
                t.to_sym
                else
                t.to_f
            end
        end
    end
    
    def evaluate string
        tokens(string).each do |t|
            case t
                when :+
				plus
                when :-
				minus
                when :*
				times
                when :/
				divide
                else
				push t
			end
        end
        value
    end
    
end


class Student
    attr_accessor :courses
    
    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        @courses = []
    end
    
    def name
        @first_name + " " + @last_name
    end
    
    def enroll(course)
        return if courses.include?(course)
        return if course.students.include?(self)
        return if has_conflict?(course)
        
        courses<<course
        courses.students<<self
    end
    
    def course_load
        course_load = Hash.new { |created_hash, key| created_hash[key] = 0 }
        courses.each { |course| course_load[course.department] += course.credits}
        course_load
    end
    
    def has_conflict?(new_course)
        self.courses.any? do |enrolled_course|
            new_course.conflicts_with?(enrolled_course)
        end
    end
    
end


class Course
    attr_accessor :name, :department, :credits, :schedule, :students
    
    def initialize(@name, @department, @credits, @schedule, @students)
        @name = name
        @department = department
        @credits = credits
        @schedule = schedule
        @students = []
    end
    
    def add_student(student)
        student.enroll(self)
    end
    
    def conflicts_with?(course2)
        sched1 = self.schedule
        sched2 = course2.schedule
        
        sched1.any? do |day, time_block|
            sched2.include?([day, time_block])
        end
    end
    
end




class Board
    attr_accessor :pos, :mark
    
    def initialize(@pos, @mark)
        @pos = pos
        @mark = mark
        @tiles = Array.new(3){Array.new(3)}
    end
    
    def won?
        
        if any row, column, diagonal has 3 marks
        end
        
        def winner
        end
        
        def empty?(pos)
        end
        
        def place_mark(pos, mark)
        end
        
    end
    
    
    
    
    class Game
        
        def play
        end
        
    end
    
    class HumanPlayer
    end
    
    class ComputerPlayer
    end
