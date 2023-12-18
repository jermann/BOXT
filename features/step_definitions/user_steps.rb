Given("a user with ID {int}") do |user_id|
  @user = User.new(id: user_id)
end

When("the user creates a new booking with storage ID {int} and booked space {int}") do |storage_id, booked_space|
  @user.new_booking(storage_id, booked_space)
end

Then("the user should have a booking with storage ID {int} and booked space {int}") do |expected_storage_id, expected_booked_space|
  booking = @user.bookings.first
  expect(booking["storage_id"]).to eq(expected_storage_id)
  expect(booking["booked_space"]).to eq(expected_booked_space)
end

When("the user retrieves their listings") do
  @user.listing
end

Then("the user should have a list of listings") do
  expect(@user.listings).not_to be_nil
end