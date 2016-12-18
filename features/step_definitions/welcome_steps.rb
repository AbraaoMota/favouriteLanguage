When(/^I view index page$/) do
  visit index_path
end

Then(/^I am greeted by the page$/) do
  assert page.has_content?('Welcome to favLang!')
end

Then(/^I can search for a user name$/) do
  assert page.has_content?('Search for a user:')
  # Have a search box here
end
