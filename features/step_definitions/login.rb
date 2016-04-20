# Login

include Devise::TestHelpers

Given(/^I am logged in as "(.*?)"$/) do |user|
  visit user_session_path # <-- this causes an error
  fill_in 'Email', with: "#{user}@email.com"
  fill_in 'Password', with: "asdasdasd"
  click_on 'Sign In'
  expect(page).to have_selector '.notice'
end
