json.partial! "departments/department", department: @department
json.employees @department.employees, :name, :role, :age, :gender, :phone, :address
