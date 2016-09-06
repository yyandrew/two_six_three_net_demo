Feature: Home page
  Scenario: Viewing application's home page
    Given there is a department named "Computers" with "Hello, 263net" description
    When I am on the homepage
    Then I should see the "Computers" department

