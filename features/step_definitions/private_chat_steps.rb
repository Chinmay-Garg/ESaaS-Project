Given(/^the following users exist:$/) do |table|
  # table is a table.hashes.keys # => [:username, :email, :password]
  table.hashes.each do |user|
    User.create(username:user[:title], email:user[:email], password:user[:password])
  end
end

When /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

And /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

And /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then(/^I "([^"]*)" should see options to send messages to "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  pending
end

When(/^I send a message "([^"]*)" to "([^"]*)"$/) do |arg1, arg2|
  pending
end

Then(/^I should see the message "([^"]*)" on the chat with "([^"]*)"$/) do |arg1, arg2|
  pending
end

And(/^I should not see the message "([^"]*)" on the chat with "([^"]*)"$/) do |arg1, arg2|
  pending
end