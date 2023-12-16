Feature: View User Profile and Provide Ratings

  As a user
  So that I can view my profile page with my listings and booked spaces
  I want to rate my booked spaces.


Background: Listings in database
    Given the following storage listings exist:
    | name              | available_space | price | campus_dist | rating  | start_date  | end_date    |
    | Storage A         | 100             | 50    | 1           | 3.4     | 2024-05-21  | 2024-07-21  |
    | Storage B         | 200             | 60    | 2           | 2.6     | 2024-06-02  | 2024-08-02  |
    | Storage C         | 150             | 70    | 3           | 1.9     | 2023-12-11  | 2024-01-11  |
    | Storage D         | 250             | 80    | 4           | 4.5     | 2024-08-19  | 2024-10-19  |
    | Storage E         | 120             | 90    | 5           | 4.2     | 2024-09-30  | 2024-11-30  |
    Given I am signed up
    Given I am logged in
    And I visit the home page 
    And I click on the "Storage A" link
    Then I should see "Book Space (in sq. ft.):"
    When I fill in "storage[book_space]" with "10"
    And I press "Confirm Booking"
    Then I should be on the home page
    And I should see "10 sq ft. booked in storage 'Storage A' booked."
    And I follow "Add new storage"
    Then I should see "Create New Storage"
    When I fill in "Name" with "Storage F"
    And I fill in "Available Space (in Sq. ft.)" with "600"
    And I fill in "Price per Sq. ft. (in $)" with "3.5"
    And I fill in "Distance from Campus (in Miles)" with "2"
    And I fill in "Rating" with "4.8"
    And I fill in "Availability Start Date" with "2024-05-21"
    And I fill in "Availability End Date" with "2024-07-21"
    And I press "Save"
    Then I should be on the home page
    And I should see "Storage F was successfully created."

  Scenario: Book space when logged in
    Given I am on my profile page
    Then I should see "All Storages Listed:"
    Then I should see "Storage F"
    Then I should see "All Storages Booked:"
    Then I should see "Storage A"
    When I fill in "booking[user_rating]" with "4.2"
    And I press "Rate"
    Then I should see "Rating Given: 4.2/5.0"
