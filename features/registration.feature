Feature: Registrations Controller

  Scenario: User signs up successfully
    Given I am on the sign-up page
    When I fill in the registration form with valid details
    And I submit the form
    Then I should be redirected to the root path
