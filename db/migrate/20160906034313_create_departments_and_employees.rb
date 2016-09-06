class CreateDepartmentsAndEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :departments_employees do |t|
      t.integer :department_id
      t.integer :employee_id
    end
  end
end
