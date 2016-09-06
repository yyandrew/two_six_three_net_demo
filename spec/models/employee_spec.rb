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
  end

  it 'phone should not be nil' do
  end
end
