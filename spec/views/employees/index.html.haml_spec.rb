require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees,[
      FactoryGirl.create(:employee, {name: "andrew0", role: 0, age: 29, gender: 1, phone: "12345678901", address: "shanghai"}),
      FactoryGirl.create(:employee, {name: "andrew1", role: 0, age: 29, gender: 1, phone: "12345678901", address: "shanghai"})
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "andrew0".to_s, :count => 1
    assert_select "tr>td", :text => "andrew1".to_s, :count => 1
    assert_select "tr>td", :text => "manager", :count => 2
    assert_select "tr>td", :text => 29.to_s, :count => 2
    assert_select "tr>td", :text => "male", :count => 2
    assert_select "tr>td", :text => "12345678901".to_s, :count => 2
    assert_select "tr>td", :text => "shanghai".to_s, :count => 2
  end
end
