Given(/^I go to login page$/) do
  visit "/authors/sign_in"
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

When(/^I wait for (\d+) seconds$/) do |n|
  sleep(n.to_i)
end

Then(/^page have message "(.*?)"$/) do |field|
  page.should have_selector ".notice", text: "Signed in successfully."
end