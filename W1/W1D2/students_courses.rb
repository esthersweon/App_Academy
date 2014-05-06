class Student
    attr_accessor :courses
    
    def initialize(first_name, last_name)
        @first_name, @last_name = first_name, last_name
        @courses = []
    end
    
    def name
        "#{@first_name} #{@last_name}"
    end
    
    def enroll(course)
        return if courses.include?(course)
        raise "Course would cause conflict!" if has_conflict?(course)
        
        courses<<course
        course.students<<self
    end
    
    def course_load
        load = Hash.new { |created_hash, key| created_hash[key] = 0 }
        self.courses.each { |course| load[course.department] += course.credits}
        load
    end
    
 ##   or
 ##
 ##     def course_load
 ##        load = Hash.new(0)
 ##
 ##       self.courses.each do |course|
 ##           load[course.department] += course.credits
 ##           end
 ##       load
 ##   end
    
    
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