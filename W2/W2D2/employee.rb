class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name = "Ted", title = "Employee", salary = 30, boss = [])
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name = "Bob", title = "Manager", salary = 60, boss = [], employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    all_salaries = self.salary
    employee_array = @employees.dup

    until employee_array.empty?
      employee = employee_array.shift
      all_salaries += employee.salary
      employee_array.push(*employee.employees) if employee.is_a?(Manager) #because employee.employees = Array
    end

    all_salaries * multiplier

    # multiplier * subsalaries      #recursive method
  end

  # def subsalaries           #recursive method
  #   sal = self.salary
  #   employees.each do |emp|
  #     if(emp.is_a?(Manager))
  #       sal += emp.subsalaries
  #     else
  #       sal += emp.salary
  #     end
  #   end
  #   sal
  # end

end






