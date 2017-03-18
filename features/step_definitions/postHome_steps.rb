When(/^I go to the Post home$/) do
  visit root_path
end

Then(/^I should see the Post home$/) do
  expect(page).to have_content("Post")
end
