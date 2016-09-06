Given(/^there is a new department$/) do
  @department = FactoryGirl.build(:department)
end

When(/^I am on the new department page$/) do
  visit new_department_path
end

Then(/^I have a new department form$/) do
  expect(page).to have_selector("//form")
  expect(page).to have_field("department[name]")
  expect(page).to have_field("department[description]")
  expect(page).to have_css("button.btn.create")
end

When(/^I click "(.*?)" on department new page?/) do |btn|
  visit new_department_path
  page.fill_in "department[name]", with: "department1 of 263net"
  click_button(btn)
end
Then(/^Go to department show page$/) do
  expect(URI(page.current_url).path).to match(/\/departments\/\d+/)
end
