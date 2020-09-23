class GroupsController < ApplicationController

  def create_groups
    employees = Employee.random.to_a
    group_size = return_group_size(employees)
    @groups = []
    unassigned_employees = employees.size%group_size
    group_number = 0
    while employees.size > 0
      pop_size = group_size <= employees.size ? group_size : employees.size
      @groups[group_number] = employees.pop(pop_size)
      group_number+=1
    end
    render json: @groups
  end

  private
    def return_group_size(employees)
      size = employees.size
      return 3 if size%3 ==0
      return 4 if size%4 ==0
      return 5 if size%5 ==0
      min =  size >= 3 ? 3 : size
      max =  size >= 5 ? 5 : size
      return rand(min..max)
    end
end
