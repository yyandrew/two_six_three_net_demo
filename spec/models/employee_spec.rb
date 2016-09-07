require 'rails_helper'

RSpec.describe Employee, type: :model do
  before :all do
    @employee = FactoryGirl.build(:employee)
  end

  it 'name should not be nil' do
    @employee.name = nil
    @employee.save
    expect(@employee.errors[:name]).to include("can't be blank")
  end

  it 'name should be uniqueness' do
    @employee.name = "andrew"
    @employee.save
    employee1 = FactoryGirl.build(:employee, {name: "andrew"})
    employee1.save
    expect(employee1.errors[:name]).to include("has already been taken")
  end

  it 'phone should not be nil' do
    @employee.phone = nil
    @employee.save
    expect(@employee.errors[:phone]).to include("can't be blank")
  end

  it 'should have manage and staff role' do
    expect(Employee.roles.keys).to eq(["manager", "staff"])
  end

  it 'should have manage and staff role' do
    expect(Employee.genders.keys).to eq(["female", "male"])
  end

  context '#json' do
    before :all do
      @departments = [
        FactoryGirl.build(:department, {name: "Tech1"}),
        FactoryGirl.build(:department, {name: "Tech2"})
      ]
    end
    it 'should return departments information' do
      @employee.departments << @departments
      @employee.save
      @employee.reload
      expect(@employee.json["departments"]).to eq([{"name"=>"Tech1"}, {"name"=>"Tech2"}])
    end
  end
end
