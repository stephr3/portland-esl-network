require 'rails_helper'

describe "the edit a volunteer site process", vcr: true do
  it "edits a volunteer site", js: true do
    FactoryGirl.create(:admin)
    FactoryGirl.create(:volunteer_site)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit '/real-world'
    click_link 'edit-volunteer-site'
    fill_in 'Name', with: 'Updated Volunteer Site Name'
    click_button 'Submit Volunteer Site'
    expect(page).to have_content 'Updated Volunteer Site Name'
  end

  it 'returns error if name is not filled in' do
    FactoryGirl.create(:volunteer_site)
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit '/real-world'
    click_link 'edit-volunteer-site'
    fill_in 'Name', with: ''
    click_button 'Submit Volunteer Site'
    expect(page).to have_content 'your volunteer site updates have not been successfully submitted'
  end
end
