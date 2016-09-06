require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      FactoryGirl.create(:department, {name: "department_name", description: "dep_desc"}),
      FactoryGirl.create(:department, {name: "department_name", description: "dep_desc"})
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => "department_name".to_s, :count => 2
    assert_select "tr>td", :text => "dep_desc".to_s, :count => 2
  end
end
