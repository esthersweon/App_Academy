def rps(my_choice)
  
  computer_choice = ["rock", "paper", "scissors"].sample
  victories = [ ["rock", "scissors"], ["scissors", "paper"], ["paper", "rock"] ]
  if victories.include?([my_choice, computer_choice])
    outcome = "Win"
  elsif my_choice == computer_choice
    outcome = "Draw"
  else
    outcome = "Lose"
  end
  puts computer_choice + ", " + outcome
end


def remix(arr)
  alcohols, mixers = [], []
  arr.each do |alcohol, mixer|
    alcohols << alcohol
    mixers << mixer
  end
  p alcohols.zip(mixers.shuffle)
end


def finder(start)
  (start > 250 && start % 7 == 0) ? start : finder(start + 1)
end


# finder, version 2
#
# def finder
#   x = 250
#   loop do
#     break if x & 7 == 0
#     x+=1
#   end
#   x
# end


def factors(int)
  answer = []

  (1..int).each do |factor|
    answer << factor if int % factor == 0
  end
  p answer
end


def bubble_sort(arr)
  sorted = false
  until sorted
    sorted = true

    i = 0
    (arr.length - 1).times do
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
      i += 1
    end
  end
  p arr
end


def substrings(str)
  letters = str.split("")
  answer = []

  letters.each_index do |start_index|
    end_index = start_index

    until end_index >= letters.length
      answer << letters[start_index..end_index].join
      end_index += 1
    end

  end
  answer
end


def subwords(str)
  combos = substrings(str)
  contents = File.readlines("dictionary.txt")
  new_contents = contents.map { |line| line.chomp }
  combos.select! { |combo| new_contents.include?(combo) }
end


def super_print(str, options = {})
  defaults = {
    :time => 1,
    :upcase => false,
    :reverse => false
  }

  options = defaults.merge(options)

  str = str.dup

  if options[:upcase]
    str.upcase!
  end
  if options[:reverse]
    str.reverse!
  end
  options[:time].times { p str }
end


def guessing_game
  comp_choice = (Array (1..100)).sample
  guesses = 0

  p comp_choice

  loop do
    puts "What is your guess?"
    guess = gets.chomp.to_i

    if guess > comp_choice
      puts "TOO HIGH"
    elsif guess < comp_choice
      puts "TOO LOW"
    else
      puts "YOU'RE RIGHT. YOU GUESSED #{guesses} TIMES!"
      break
    end

    guesses += 1
  end

end


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


def file_reader
  puts "Which file would you like to read?"
  user_input = gets.chomp
  contents = File.readlines(user_input).map(&:chomp).shuffle

  puts "What would you like the file to be named?"
  input_name = gets.chomp
  File.open(input_name, 'w') do |file|
    file.write(contents.join("\n"))
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































