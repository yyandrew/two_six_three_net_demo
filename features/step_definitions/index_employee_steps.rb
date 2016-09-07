Given(/^there is a employee named "(.*?)" with "(.*?)" role, "(.*?)" age, "(.*?)" gender, "(.*?)" phone and "(.*?)" address$/) do |name, role, age, gender, phone, address|
  @employee = FactoryGirl.create(:employee, name: name, role: role.to_i, age: age.to_i, gender: gender.to_i, phone: phone, address: address)
end

When(/^I am on the employees index page$/) do
  visit employees_path
end

Then(/^I should see the "(.*?)" employee$/) do |name|
  @employee = Employee.find_by_name(name)

  expect(page).to have_content(@employee.name)
  expect(page).to have_content(@employee.role)
  expect(page).to have_content(@employee.age)
  expect(page).to have_content(@employee.gender)
  expect(page).to have_content(@employee.phone)
  expect(page).to have_content(@employee.address)
end

Then(/^I should see the "(.*?)" and "(.*?)" menus on employees index page$/) do |menu1, menu2|
  expect(page).to have_content(menu1)
  page.should have_content(menu2)
end

Then(/^I should see the "(.*?)" link on employees index page$/) do |link|
  expect(page).to have_content(link)
end

When(/^I click "(.*?)" on index page$/) do |link|
  visit employees_path
  click_link(link)
end

Then(/^I should go to "(.*?)" page from employees index page$/) do |new_path|
  expect(URI(page.current_url).path).to eq(new_path)
end
