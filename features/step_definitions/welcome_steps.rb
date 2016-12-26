When(/^I view index page$/) do
  visit index_path
end

Then(/^I am greeted by the page$/) do
  assert page.has_content?('Welcome to favLang!')
end

Then(/^I can search for a user name$/) do
  assert page.has_field?('Search for')
end

Given(/^I am at the index page$/) do
  visit index_path
end

When(/^I search for a valid user name$/) do
  fill_in 'name', with: 'AbraaoMota'
  click_on 'Search'
end

Then(/^I can see that user's favourite language$/) do
  assert page.has_content?("abraaomota's favourite language")
end

When(/^I search for an invalid user name$/) do
  fill_in 'name', with: 'asdfghsdfjsdfuihjsdf'
  click_on 'Search'
end

Then(/^I am told that that user doesn't exist$/) do
  assert page.has_content?("That user doesn't exist in Github")
end
