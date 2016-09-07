3.times do
  department = FactoryGirl.create(:department)
  3.times do
    department.employees << FactoryGirl.create(:employee)
  end
end
