module GroupsHelper
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
