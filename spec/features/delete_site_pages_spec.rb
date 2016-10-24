require 'rails_helper'

describe "the delete a site process", vcr: true do
  it "deletes a site" do
    site = FactoryGirl.create(:site)
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit site_path(site)
    click_on "Delete this Class"
    expect(page).to have_content 'ESL Classes'
  end
end
