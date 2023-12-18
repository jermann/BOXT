Feature: User Class Functionality

  Scenario: User creates a new booking
    Given a user with ID 1
    When the user creates a new booking with storage ID 123 and booked space 10
    Then the user should have a booking with storage ID 123 and booked space 10

  Scenario: User retrieves listings
    Given a user with ID 1
    When the user retrieves their listings
    Then the user should have a list of listings
