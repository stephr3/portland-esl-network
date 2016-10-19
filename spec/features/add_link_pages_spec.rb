require 'rails_helper'

describe "the add a link process" do
  it "adds a new link" do
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    click_link 'Add a New Link'
    expect(page).to have_content 'Add a New Link'
    select('Student Learning Resources', from: 'Link Page')
    fill_in 'Title', :with => 'Multnomah County Library Web Resources'
    fill_in 'Url', :with => 'https://multcolib.org/learn-english'
    fill_in 'Description', :with => "Multnomah Public Library's links to multiple websites."
    fill_in 'Link Category', :with => "General Resources"
    click_button 'Submit Link'
    visit '/links?type=learning'
    expect(page).to have_content 'Multnomah County Library Web Resources'
  end

  it 'will not allow a user to add a link if they are not logged in as an admin' do
    visit '/links?type=learning'
    expect(page).to have_no_content 'Add a New Link'
  end

  it 'will return error if title is not filled out' do
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit admin_path
    click_link 'Add a New Link'
    fill_in 'Url', :with => 'https://www.google.com'
    click_button 'Submit Link'
    expect(page).to have_content 'your link has not been successfully submitted'
  end
end
