Given(/^there is a department named "(.*?)" with "(.*?)" description$/) do |name, description|
  @department = FactoryGirl.create(:department, name: "Computers", description: "Hello, 263net")
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the "(.*?)" department$/) do |name|
  @department = Department.find_by_name(name)

  expect(page).to have_content(@department.name)
  expect(page).to have_content(@department.description)
end

Then(/^I should see the "(.*?)" and "(.*?)" menus$/) do |menu1, menu2|
  expect(page).to have_content(menu1)
  page.should have_content(menu2)
end

Then(/^I should see the "(.*?)" link$/) do |link|
  expect(page).to have_content(link)
end

When(/^I click "(.*?)" on home page$/) do |link|
  visit root_path
  click_link(link)
end

Then(/^I should go to "(.*?)" page$/) do |new_path|
  expect(URI(page.current_url).path).to eq(new_path)
end
