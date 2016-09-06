Given(/^there is a department named "(.*?)" with "(.*?)" description$/) do |name, description|
  @department = FactoryGirl.create(:department, name: "Computers", description: "Hello, 263net")
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the "(.*?)" department$/) do |name|
  @department = Department.find_by_name(name)

  page.should have_content(@department.name)
  page.should have_content(@department.description)
end
