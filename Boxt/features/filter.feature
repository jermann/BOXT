Feature: Filter Storage Listings
  As a user
  I want to filter storage listings based on minimum available space
  So that I can see only those listings that meet my space requirements

  Background:
    When I visit the home page

  Scenario: Filter storage listings by minimum available space
    When I fill in "Min Available Space" with "150"
    And I press "Apply Filters"
    Then I should see only storage listings with available space greater than or equal to 150

  Scenario: Filter storage listings by maximum price per sqft          |
    When I fill in "Max Price per Sq ft" with "60"
    And I press "Apply Filters"
    Then I should see only storage listings with price per sqft less than or equal to 60

  Scenario: Filter storage listings by maximum distance from campus
    When I fill in "Max Distance to Campus" with "1.5"
    And I press "Apply Filters"
    Then I should see only storage listings with a distance from campus less than or equal to 1.5
