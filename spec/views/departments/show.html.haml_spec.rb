require 'rails_helper'

RSpec.describe "departments/show", type: :view do
  before(:each) do
    @department = assign(:department, FactoryGirl.create(:department, { :name => "dep_name", :description => "dep_desc" }))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/dep_name/)
    expect(rendered).to match(/dep_desc/)
  end
end
