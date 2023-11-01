# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
listings = [
  {:name => '1992 Broadway', :available_space => 600, :price => 9.19, :start_date => '10-May-2024', :end_date => '28-Aug-2024', :campus_dist => 0.1, :rating => 5},
  {:name => '600 W 122nd St', :available_space => 200, :price => 3.29, :start_date => '31-May-2024', :end_date => '28-Jul-2024', :campus_dist => 1.2, :rating => 3},
  {:name => '101 Central Park West', :available_space => 64, :price => 1.89, :start_date => '21-May-2024', :end_date => '01-Aug-2024', :campus_dist => 0.3, :rating => 4.8},
  {:name => '200 W 116th', :available_space => 630, :price => 2.00, :start_date => '21-May-2024', :end_date => '01-Aug-2024', :campus_dist => 0.3, :rating => 4.8},
  {:name => '21 E 81st', :available_space => 80, :price => 3.40, :start_date => '21-May-2024', :end_date => '01-Aug-2024', :campus_dist => 0.3, :rating => 4.8},
]

listings.each do |listing|
  Storage.create!(listing)
end

