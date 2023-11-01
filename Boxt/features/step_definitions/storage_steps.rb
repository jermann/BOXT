When("I visit the home page") do
  visit root_path 
end

Given("the following storage listings exist:") do |table|
  table.hashes.each do |storage_params|
    Storage.create!(storage_params)
  end
end

Then("I should see all storage listings") do
  expect(page).to have_css('#storages') 
end

When("I click on the {string} link") do |column_name|
  click_link(column_name)
end

Then("I should see storage listings sorted by name in ascending order") do
  rows = all('#storages tbody tr')
  names = rows.map { |row| row.find('td', text: /\S/).text }
  expect(names).to eq(names.sort)
end

When("I click on the {string} link again") do |column_name|
  click_link(column_name)
  @ascending_order = !@ascending_order
end

Then("I should see storage listings sorted by name in descending order") do
  rows = all('#storages tbody tr')
  names = rows.map { |row| row.find('td', text: /\S/).text }

  if @ascending_order
    names.reverse!
  end

  expect(names).to eq(names.sort.reverse)
end

Then("I should see storage listings sorted by available space in ascending order") do
  rows = all('#storages tbody tr')
  available_space_values = rows.map { |row| row.find('td', text: /\S/).text.to_f }

  if @ascending_order
    available_space_values.reverse!
  end 

  expect(available_space_values).to eq(available_space_values.sort)
end

Then("I should see storage listings sorted by available space in descending order") do
  rows = all('#storages tbody tr')
  available_space_values = rows.map { |row| row.find('td', text: /\S/).text.to_f }

  if @ascending_order
    available_space_values.reverse!
  end

  expect(available_space_values).to eq(available_space_values.sort.reverse)
end

Then("I should see storage listings sorted by price per sq. ft. in ascending order") do
  rows = all('#storages tbody tr')
  price_per_sqft_values = rows.map { |row| row.find('td', text: /\S/).text.to_f }

  if @ascending_order
    price_per_sqft_values.reverse!
  end

  expect(price_per_sqft_values).to eq(price_per_sqft_values.sort)
end

Then("I should see storage listings sorted by price per sq. ft. in descending order") do
  rows = all('#storages tbody tr')
  price_per_sqft_values = rows.map { |row| row.find('td', text: /\S/).text.to_f }

  if @ascending_order
    price_per_sqft_values.reverse!
  end

  expect(price_per_sqft_values).to eq(price_per_sqft_values.sort.reverse)
end

Then("I should see storage listings sorted by Availability Start Date in ascending order") do
  rows = all('#storages tbody tr')
  start_dates = rows.map { |row| Date.parse(row.find('td', text: /\d{2}-\w{3}-\d{4}/).text) }

  expect(start_dates).to eq(start_dates.sort)
end

Then("I should see storage listings sorted by Availability Start Date in descending order") do
  rows = all('#storages tbody tr')
  start_dates = rows.map { |row| Date.parse(row.find('td', text: /\d{2}-\w{3}-\d{4}/).text) }

  expect(start_dates).to eq(start_dates.sort.reverse)
end

Then("I should see storage listings sorted by Availability End Date in ascending order") do
  rows = all('#storages tbody tr')
  end_dates = rows.map { |row| Date.parse(row.find('td', text: /\d{2}-\w{3}-\d{4}/).text) }

  expect(end_dates).to eq(end_dates.sort)
end

Then("I should see storage listings sorted by Availability End Date in descending order") do
  rows = all('#storages tbody tr')
  end_dates = rows.map { |row| Date.parse(row.find('td', text: /\d{2}-\w{3}-\d{4}/).text) }

  expect(end_dates).to eq(end_dates.sort.reverse)
end

Then("I should see storage listings sorted by Distance from Campus in ascending order") do
  rows = all('#storages tbody tr')
  campus_distances = rows.map { |row| row.find('td', text: /\d+\.\d+/).text.to_f }

  expect(campus_distances).to eq(campus_distances.sort)
end

Then("I should see storage listings sorted by Distance from Campus in descending order") do
  rows = all('#storages tbody tr')
  campus_distances = rows.map { |row| row.find('td', text: /\d+\.\d+/).text.to_f }

  expect(campus_distances).to eq(campus_distances.sort.reverse)
end

Then("I should see storage listings sorted by Rating in ascending order") do
  rows = all('#storages tbody tr')
  ratings = rows.map { |row| row.find('td', text: /\d+\.\d+/).text.to_f }

  expect(ratings).to eq(ratings.sort)
end

Then("I should see storage listings sorted by Rating in descending order") do
  rows = all('#storages tbody tr')
  ratings = rows.map { |row| row.find('td', text: /\d+\.\d+/).text.to_f }

  expect(ratings).to eq(ratings.sort.reverse)
end

Then("I should see only storage listings with available space greater than or equal to {int}") do |min_space|
  filtered_storages = page.all(".storage-listing")

  filtered_storages.each do |storage|
    available_space = storage.find(".available-space").text.to_i
    expect(available_space).to be >= min_space
  end
end

Then("I should see only storage listings with price per sqft less than or equal to {int}") do |max_price_per_sqft|
  filtered_storages = page.all(".storage-listing")

  filtered_storages.each do |storage|
    price_per_sqft = storage.find(".price-per-sqft").text.to_i
    expect(price_per_sqft).to be <= max_price_per_sqft
  end
end

Then("I should see only storage listings with a distance from campus less than or equal to {float}") do |max_distance_from_campus|
  filtered_storages = page.all(".storage-listing")

  filtered_storages.each do |storage|
    distance_from_campus = storage.find(".distance-from-campus").text.to_f
    expect(distance_from_campus).to be <= max_distance_from_campus
  end
end

Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end

Given("I press {string}") do |string|
  click_button string
end

# AJ: The below parts are adapted from web_steps - maybe we can import instead of pasting?
When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )should be on the home page$/ do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == root_path
  else
    assert_equal root_path, current_path
  end
end