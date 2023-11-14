Feature: User Login
  As a user
  I want to log in to my account
  So that I can access my personalized content

  Scenario: Successful login
    Given I am on the login page
    When I fill in "Email" with "harry.potter@example.com"
    And I fill in "Password" with "wizard123"
    And I press "Log in"
    Then I should see "Signed in successfully."
    And I should be on the home page

  Scenario: Unsuccessful login with invalid password
    Given I am on the login page
    When I fill in "Email" with "harry.potter@example.com"
    And I fill in "Password" with "wizard"
    And I press "Log in"
    Then I am on the login page

  Scenario: Unsuccessful login with invalid username
    Given I am on the login page
    When I fill in "Email" with "harry.potter123@example.com"
    And I fill in "Password" with "wizard123"
    And I press "Log in"
    Then I am on the login page

  Scenario: Forgotten password
    Given I am on the login page
    When I click on the "Forgot your password?" link
    And I fill in "Email" with "harry.potter@example.com"
    And I press "Send me reset password instructions"
    Then I should see "You will receive an email with instructions on how to reset your password in a few minutes."

  Scenario: Log out
    Given I am on the login page
    When I fill in "Email" with "harry.potter@example.com"
    And I fill in "Password" with "wizard123"
    And I press "Log in"
    And I should be on the home page
    And I click on the "Logout" link
    Then I should see "Signed out successfully."
    Then I am on the login page

