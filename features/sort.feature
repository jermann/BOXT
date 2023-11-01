Feature: Home Page Display and Sort Storage Listings

  As a user
  So that I can easily find and organize storage listings
  I want to view storage listings on the home page and sort them by various criteria.

  Scenario: Display all storage listings on the home page
    When I visit the home page
    Then I should see all storage listings

  Scenario: Sort storage listings by name in ascending order
    When I visit the home page
    And I click on the "Address" link
    Then I should see storage listings sorted by name in ascending order

  Scenario: Sort storage listings by name in descending order
    When I visit the home page
    And I click on the "Address" link
    And I click on the "Address" link again
    Then I should see storage listings sorted by name in descending order

  Scenario: Sort storage listings by available space in ascending order
    When I visit the home page
    And I click on the "Space (Sq ft)" link
    Then I should see storage listings sorted by available space in ascending order

  Scenario: Sort storage listings by available space in descending order
    When I visit the home page
    And I click on the "Space (Sq ft)" link
    And I click on the "Space (Sq ft)" link again
    Then I should see storage listings sorted by available space in descending order

  Scenario: Sort storage listings by price per sq. ft. in ascending order
    When I visit the home page
    And I click on the "Price per Sq ft" link
    Then I should see storage listings sorted by price per sq. ft. in ascending order

  Scenario: Sort storage listings by price per sq. ft. in descending order
    When I visit the home page
    And I click on the "Price per Sq ft" link
    And I click on the "Price per Sq ft" link again
    Then I should see storage listings sorted by price per sq. ft. in descending order

Scenario: Sort storage listings by Availability Start Date in ascending order
  When I visit the home page
  And I click on the "Start Date" link
  Then I should see storage listings sorted by Availability Start Date in ascending order

Scenario: Sort storage listings by Availability Start Date in descending order
  When I visit the home page
  And I click on the "Start Date" link
  And I click on the "Start Date" link again
  Then I should see storage listings sorted by Availability Start Date in descending order

Scenario: Sort storage listings by Availability End Date in ascending order
  When I visit the home page
  And I click on the "End Date" link
  Then I should see storage listings sorted by Availability End Date in ascending order

Scenario: Sort storage listings by Availability End Date in descending order
  When I visit the home page
  And I click on the "End Date" link
  And I click on the "End Date" link again
  Then I should see storage listings sorted by Availability End Date in descending order

Scenario: Sort storage listings by Distance from Campus in ascending order
  When I visit the home page
  And I click on the "Distance to Campus (Miles)" link
  Then I should see storage listings sorted by Distance from Campus in ascending order

Scenario: Sort storage listings by Distance from Campus in descending order
  When I visit the home page
  And I click on the "Distance to Campus (Miles)" link
  And I click on the "Distance to Campus (Miles)" link again
  Then I should see storage listings sorted by Distance from Campus in descending order

Scenario: Sort storage listings by Rating in ascending order
  When I visit the home page
  And I click on the "Rating" link
  Then I should see storage listings sorted by Rating in ascending order

Scenario: Sort storage listings by Rating in descending order
  When I visit the home page
  And I click on the "Rating" link
  And I click on the "Rating" link again
  Then I should see storage listings sorted by Rating in descending order
