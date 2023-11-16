Feature: Create New Storage Listing

  As a user
  So that I can easily create new storage listing
  I want to be able to click a button to enter all the information I would like to be displayed.

Background: Listings in database
    Given the following storage listings exist:
    | name                         | available_space | price | campus_dist | rating  | start_date  | end_date    |
    | Unauthorized Storage         | 100             | 50    | 1           | 3.4     | 2024-05-21  | 2024-07-21  |

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
    And I fill in "Availability Start Date" with "2024-05-21"
    And I fill in "Availability End Date" with "2024-07-21"
    And I press "Save"
    Then I should be on the home page
    And I should see "606 W 201st Street was successfully created."

    When I click on the "606 W 201st Street" link
    And I follow "Edit"
    Then I should see "Edit Existing Storage"
    And I fill in "Rating" with "5.8"
    And I press "Update Storage Info"
    And I should see "Rating is not included in the list"

    Given I visit the home page
    When I click on the "606 W 201st Street" link
    And I follow "Edit"
    Then I should see "Edit Existing Storage"
    And I fill in "Rating" with "3.8"
    And I press "Update Storage Info"
    Then I should be on the home page
    And I should see "'606 W 201st Street' updated."

    When I click on the "606 W 201st Street" link
    And I follow "Delete"
    Then I should be on the home page
    And I should see "Storage '606 W 201st Street' deleted."


  Scenario: Create new listing when logged in with invalid parameters
    Given I am signed up
    Given I am logged in
    And I visit the home page
    And I follow "Add new storage"
    Then I should see "Create New Storage"
    When I fill in "Name" with "621 W 201st Street"
    And I fill in "Available Space (in Sq. ft.)" with "934"
    And I fill in "Price per Sq. ft. (in $)" with "3.5"
    And I fill in "Distance from Campus (in Miles)" with "2"
    And I fill in "Rating" with "9.8"
    And I fill in "Availability Start Date" with "2024-05-21"
    And I fill in "Availability End Date" with "2024-07-21"
    And I press "Save"
    Then I should see "Create New Storage" 
  
  Scenario: Attempt to create new listing when not logged in
    Given I am not logged in
    And I visit the home page
    And I follow "Add new storage"
    Then I should be on the login page

  Scenario: Attempt to delete listing without authorization
    Given I am signed up
    Given I am logged in
    And there is a storage listing with name "Unauthorized Storage"
    When I visit the home page
    And I click on the "Unauthorized Storage" link
    And I follow "Delete"
    Then I should be on the home page
    And I should see "You are not authorized to edit/delete this storage"
    And I should not see "Storage 'Unauthorized Storage' deleted."
  
  Scenario: Attempt to delete listing when not logged in
    Given I am not logged in
    And there is a storage listing with name "Unauthorized Storage"
    When I visit the home page
    And I click on the "Unauthorized Storage" link
    And I follow "Delete"
    Then I should be on the login page