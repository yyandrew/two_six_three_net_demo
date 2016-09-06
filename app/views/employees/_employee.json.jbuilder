json.extract! employee, :id, :name, :role, :age, :gender, :phone, :address, :created_at, :updated_at
json.url employee_url(employee, format: :json)