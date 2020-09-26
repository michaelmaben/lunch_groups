class GroupsController < ApplicationController
  include GroupsHelper

  def create_groups
    employees = Employee.random.to_a
    group_size = calculate_group_size(employees)
    @groups = []
    group_number = 0
    while employees.size > 0
      pop_size = employees.size <= group_size ? employees.size : group_size
      @groups[group_number] = employees.pop(pop_size)
      group_number+=1
    end
    @groups
  end


  private

  def calculate_group_size(employees)
    size = employees.size
    # check if groups can be of equal size
    return 3 if size % 3 ==0 || (size % 3).between?(3, 5)
    return 4 if size % 4 ==0 || (size % 4).between?(3, 5)
    return 5 if size % 5 ==0 || (size % 5).between?(3, 5)
  end
end
