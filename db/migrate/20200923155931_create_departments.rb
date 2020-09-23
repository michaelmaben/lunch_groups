class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end
    Department.create(name: "Sales")
    Department.create(name: "Development")
  end
end
