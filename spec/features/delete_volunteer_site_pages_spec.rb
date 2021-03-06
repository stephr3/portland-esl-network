require 'rails_helper'

describe "the delete a volunteer site process", vcr: true do
  it "deletes a volunteer site" do
    FactoryGirl.create(:volunteer_site)
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit '/real-world'
    click_on "delete-volunteer-site"
    expect(page).to have_no_content 'Birch Community Services'
  end
end
