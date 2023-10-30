Feature: Home Page Display and Sort Storage Listings

  Scenario: Display all storage listings on the home page
    When I visit the home page
    Then I should see all storage listings

  Scenario: Sort storage listings by name in ascending order
    When I visit the home page
    And I click on the "Name" link
    Then I should see storage listings sorted by name in ascending order

  Scenario: Sort storage listings by name in descending order
    When I visit the home page
    And I click on the "Name" link
    And I click on the "Name" link again
    Then I should see storage listings sorted by name in descending order

  Scenario: Sort storage listings by available space in ascending order
    When I visit the home page
    And I click on the "Available Space (in Sq. ft.)" link
    Then I should see storage listings sorted by available space in ascending order

  Scenario: Sort storage listings by available space in descending order
    When I visit the home page
    And I click on the "Available Space (in Sq. ft.)" link
    And I click on the "Available Space (in Sq. ft.)" link again
    Then I should see storage listings sorted by available space in descending order

  Scenario: Sort storage listings by price per sq. ft. in ascending order
    When I visit the home page
    And I click on the "Price per Sq. ft. (in $)" link
    Then I should see storage listings sorted by price per sq. ft. in ascending order

  Scenario: Sort storage listings by price per sq. ft. in descending order
    When I visit the home page
    And I click on the "Price per Sq. ft. (in $)" link
    And I click on the "Price per Sq. ft. (in $)" link again
    Then I should see storage listings sorted by price per sq. ft. in descending order

