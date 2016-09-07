Feature: employees page
  Scenario: Viewing employees index page
    Given there is a employee named "andrew" with "staff" role, "29" age, "male" gender, "12345678901" phone and "shanghai" address
    When I am on the employees index page
    Then I should see the "andrew" employee
    And I should see the "Departments" and "Employees" menus on employees index page
    And I should see the "New Employee" link on employees index page
    When I click "New Employee" on index page
    Then I should go to "/employees/new" page from employees index page
