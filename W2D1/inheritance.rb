class Employee

  attr_reader :salary, :name, :boss, :title

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary.to_i, boss
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def inspect
    "Name: #{name}"
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(new_employee)
    employees << new_employee
  end

  def bonus(multiplier)
    employee_salaries(name) * multiplier
  end

  def employee_salaries(manager_name = nil)
    salaries = []
    employees.each do |employee|
      if employee.is_a? Manager
        salaries << employee.employee_salaries
      else
        salaries << employee.salary
      end
    end
    if self.is_a?(Manager) && name != manager_name
      salaries << salary
    end
    salaries.reduce(:+)
  end

  private

  attr_writer :employees
end
