require 'rails_helper'

RSpec.describe Department, type: :model do
  before :all do
    @department = FactoryGirl.build(:department)
  end

  it 'name should not be nil' do
    @department.name = nil
    @department.save
    expect(@department.errors[:name]).to include("can't be blank")
  end

  it 'should be valid if name and description are both not nil' do
    @department.name = Faker::Commerce.department
    expect(@department).to be_valid
  end
end
