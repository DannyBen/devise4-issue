# Login

Given(/^I am logged in as "(.*?)"$/) do |user|
  User.create!(email: "user@email.com", password: "asdasdasd")

  visit new_user_session_path
  fill_in 'Email', with: "#{user}@email.com"
  fill_in 'Password', with: "asdasdasd"
  click_on 'Log in'
  assert page.has_content?('Welcome#index'), "User must have logged in"
end
