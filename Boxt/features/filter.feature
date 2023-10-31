Feature: Filter storage listings by criteria

  As a user
  So that I can find storage listings that match my criteria
  I want to filter storage listings based on minimum available space, max price per sq. ft., and max distance from campus.

  Background: storage listings are available

    Given the following storage listings exist:
    | name              | available_space | price | campus_dist |
    | Storage A         | 100             | 50    | 1           |
    | Storage B         | 200             | 60    | 2           |
    | Storage C         | 150             | 70    | 3           |
    | Storage D         | 250             | 80    | 4           |
    | Storage E         | 120             | 90    | 5           |

    When I visit the home page

  Scenario: filter by minimum available space
    When I apply the following filters:
      | Min Available Space |
      | 150                 |
    Then I should see "Storage B"
    And I should see "Storage C"
    And I should see "Storage D"

  Scenario: filter by max price per sq. ft.
    When I apply the following filters:
      | Max Price per Sq. ft. |
      | 70                   |
    Then I should see "Storage A"
    And I should see "Storage B"
    And I should see "Storage C"

  Scenario: filter by max distance from campus
    When I apply the following filters:
      | Max Distance from Campus |
      | 3                       |
    Then I should see "Storage A"
    And I should see "Storage B"
    And I should see "Storage C"

  Scenario: combine multiple filters
    When I apply the following filters:
      | Min Available Space | Max Price per Sq. ft. | Max Distance from Campus |
      | 150                 | 70                   | 3                       |
    Then I should see "Storage B"
