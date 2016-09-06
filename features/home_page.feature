Feature: Home page
  Scenario: Viewing application's home page
    Given there is a department named "Computers" with "Hello, 263net" description
    When I am on the homepage
    Then I should see the "Computers" department
    And I should see the "Departments" and "Employees" menus
    And I should see the "New Department" link
    When I click "New Department" on home page
    Then I should go to "/departments/new" page
