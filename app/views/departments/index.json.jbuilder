json.array!(@departments) do | dep|
  json.(dep, :id, :name, :description)
  json.employees dep.employees do |emp|
    json.id emp.id
    json.name emp.name
    json.role emp.role
    json.age emp.age
    json.gender emp.gender
    json.phone emp.phone
    json.address emp.address
  end
end
