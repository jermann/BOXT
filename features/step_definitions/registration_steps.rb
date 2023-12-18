Given("I am on the sign-up page") do
  visit new_user_registration_path
end

When("I fill in the registration form with valid details") do
  fill_in "user_email", with: "test@example.com"
  fill_in "user_password", with: "password123"
  fill_in "user_password_confirmation", with: "password123"
end

And("I submit the form") do
  click_button "Sign up"
end

Then("I should be redirected to the root path") do
  expect(current_path).to eq(root_path)
end