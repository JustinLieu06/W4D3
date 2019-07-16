class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end
end

class Manager < Employee
  attr_reader :grunts
  def initialize(name, title, salary, boss)
    super
    @grunts = []
  end 

  def bonus(multiplier)
    total_grunt_salary = salary_adder(self) - salary
    bonus = total_grunt_salary * multiplier
  end

end

def salary_adder(employee_node)
  queue = [employee_node]
  total_salary = 0

  until queue.empty?
    current_employee = queue.shift
    total_salary += current_employee.salary

    p current_employee.class
    if current_employee.class != Employee
      queue.concat(current_employee.grunts)
    end
  end

  total_salary
end

p carlos = Manager.new("Carlos", "TA", 30000, "Ronil")
p jen = Employee.new("Jen", "Grunt", 10000, "Carlos")
carlos.grunts << jen
p carlos.bonus(0.10)
p jen.bonus(0.20)