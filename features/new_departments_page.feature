Feature: Department new page
  Scenario: Viewing application's Department new page
    Given there is a new department
    When I am on the new department page
    Then I have a new department form
    When I click "Create Department" on department new page
    Then Go to department show page
