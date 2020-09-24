class GroupsController < ApplicationController
  include GroupsHelper

  def create_groups
    employees = Employee.random.to_a
    group_size = calculate_group_size(employees)
    @groups = []
    group_number = 0
    while employees.size > 0
      pop_size = group_size <= employees.size ? group_size : employees.size
      @groups[group_number] = employees.pop(pop_size)
      group_number+=1
    end
    @groups
  end

end
