Feature: Create New Storage Listing

  As a user
  So that I can easily create new storage listing
  I want to be able to click a button to enter all the information I would like to be displayed.

  Scenario: create new listing
    Given I visit the home page
    And   I follow "Add new storage"
    When  I fill in "Name" with "606 W 125th Street"
    And   I fill in "Available Space (in Sq. ft.)" with "600"
    And   I fill in "Price per Sq. ft. (in $)" with "3.5"
    And   I fill in "Distance from Campus (in Miles)" with "2"
    And   I fill in "Rating" with "4.8"
    And   I press "Save Changes"
    Then  I should be on the home page
    And   I should see "606 W 125th Street was successfully created."