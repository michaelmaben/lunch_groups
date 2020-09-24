module GroupsHelper
  def calculate_group_size(employees)
    size = employees.size
    # check if groups can be of equal size
    return 3 if size % 3 ==0
    return 4 if size % 4 ==0
    return 5 if size % 5 ==0
    # otherwise randomly use a size between 3 and 5
    min =  size >= 3 ? 3 : size
    max =  size >= 5 ? 5 : size
    return rand(min..max)
  end
end
