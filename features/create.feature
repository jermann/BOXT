Feature: Create New Storage Listing

  As a user
  So that I can easily create new storage listing
  I want to be able to click a button to enter all the information I would like to be displayed.

Background: Listings in database
    Given the following storage listings exist:
    | name              | available_space | price | campus_dist | rating  | start_date  | end_date    |
    | Storage A         | 100             | 50    | 1           | 3.4     | 2024-05-21  | 2024-07-21  |
    | Storage B         | 200             | 60    | 2           | 2.6     | 2024-06-02  | 2024-08-02  |
    | Storage C         | 150             | 70    | 3           | 1.9     | 2023-12-11  | 2024-01-11  |
    | Storage D         | 250             | 80    | 4           | 4.5     | 2024-08-19  | 2024-10-19  |
    | Storage E         | 120             | 90    | 5           | 4.2     | 2024-09-30  | 2024-11-30  |

  Scenario: Create new listing when logged in
    Given I am signed up
    Given I am logged in
    And I visit the home page
    And I follow "Add new storage"
    Then I should see "Create New Storage"
    When I fill in "Name" with "606 W 201st Street"
    And I fill in "Available Space (in Sq. ft.)" with "600"
    And I fill in "Price per Sq. ft. (in $)" with "3.5"
    And I fill in "Distance from Campus (in Miles)" with "2"
    And I fill in "Rating" with "4.8"
    And I fill in "Availability Start Date" with "11/30/2023"
    And I fill in "Availability End Date" with "11/30/2024"
    And I press on Save
    And I press "Save"
    Then I should be on the home page
  
  Scenario: Attempt to create new listing when not logged in
    Given I am not logged in
    And I visit the home page
    And I follow "Add new storage"
    Then I should be on the login page