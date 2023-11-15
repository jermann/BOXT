Feature: Book Storage Listing

  As a user
  So that I can easily book a storage listing
  I want to be able to click a button to book the storage.


Background: Listings in database
    Given the following storage listings exist:
    | name              | available_space | price | campus_dist | rating  | start_date  | end_date    |
    | Storage A         | 100             | 50    | 1           | 3.4     | 2024-05-21  | 2024-07-21  |
    | Storage B         | 200             | 60    | 2           | 2.6     | 2024-06-02  | 2024-08-02  |
    | Storage C         | 150             | 70    | 3           | 1.9     | 2023-12-11  | 2024-01-11  |
    | Storage D         | 250             | 80    | 4           | 4.5     | 2024-08-19  | 2024-10-19  |
    | Storage E         | 120             | 90    | 5           | 4.2     | 2024-09-30  | 2024-11-30  |

  Scenario: Book space when logged in
    Given I am signed up
    Given I am logged in
    And I visit the home page 
    And I click on the "Storage A" link
    And I press "Confirm Booking"
    Then I should be on the home page
    And I should see "Storage 'Storage A' booked"

  Scenario: Attempt to book space when not logged in
    Given I am not logged in
    And I visit the home page 
    And I click on the "Storage A" link
    And I press "Confirm Booking"
    Then I should be on the login page

    Scenario:
