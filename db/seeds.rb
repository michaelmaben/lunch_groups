# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.create(name: "Sales")
Department.create(name: "Development")


sales = Department.find_by_name("Sales")
dev = Department.find_by_name("Development")

sales_employees = [
  [ "s_001", "F-1", "L-1" ],
  [ "s_002", "F-2", "L-2" ],
  [ "s_003", "F-3", "L-3" ],
  [ "s_004", "F-4", "L-4" ],
]
dev_employees = [
  [ "d_001", "F-1", "L-1" ],
  [ "d_002", "F-2", "L-2" ],
  [ "d_003", "F-3", "L-3" ],
  [ "d_004", "F-4", "L-4" ],
]

sales_employees.each do |badge_id, first_name, last_name|
  Employee.create(badge_id: badge_id, first_name: first_name, last_name: last_name, department_id: sales.id )
end

dev_employees.each do |badge_id, first_name, last_name|
  Employee.create(badge_id: badge_id, first_name: first_name, last_name: last_name, department_id: dev.id )
end
