require 'rails_helper'

describe "the search map process", vcr: true do
  it "allows user to search map by zipcode" do
    visit root_path
    fill_in 'center-map', with: '97211'
    click_button 'Search'
    expect(page).to have_content 'Your search: 97211'
  end
  it "displays an error if an invalid zip code has been entered" do
    visit root_path
    fill_in 'center-map', with: 'invalid'
    click_button 'Search'
    expect(page).to have_content 'Please enter a valid zip code.'
  end
end
