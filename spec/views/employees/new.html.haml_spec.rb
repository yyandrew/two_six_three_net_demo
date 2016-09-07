require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, FactoryGirl.build(:employee))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input#employee_name[name=?]", "employee[name]"

      assert_select "select#employee_role[name=?]", "employee[role]"

      assert_select "input#employee_age[name=?]", "employee[age]"

      assert_select "select#employee_gender[name=?]", "employee[gender]"

      assert_select "input#employee_phone[name=?]", "employee[phone]"

      assert_select "textarea#employee_address[name=?]", "employee[address]"
    end
  end
end
