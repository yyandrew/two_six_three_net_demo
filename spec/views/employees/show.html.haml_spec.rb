require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, FactoryGirl.create(:employee, {name: "andrew0", role: 0, age: 29, gender: 1, phone: "12345678901", address: "shanghai"}))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/andrew0/)
    expect(rendered).to match(/0/)
    expect(rendered).to match(/29/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/12345678901/)
    expect(rendered).to match(/shanghai/)
  end
end
