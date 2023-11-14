Given("I am on the login page") do
  visit new_user_session_path
end

Given("I am logged in") do
  visit new_user_session_path
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

Given("I am not logged in") do
  delete destroy_user_session_path 
end

Then("I should be on the login page") do
  expect(current_path).to eq(new_user_session_path)
end
