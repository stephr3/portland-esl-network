require 'rails_helper'

describe "the edit a site process", vcr: true do
  it "edits a site" do
    site = FactoryGirl.create(:site)
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit site_path(site)
    click_on 'Edit Class Information'
    fill_in 'Name', with: 'Best ESL Class'
    select('OR', from: 'site_state')
    select('Downtown', from: 'site_region')
    click_on 'Submit Class'
    expect(page).to have_content 'Best ESL Class'
  end

  it "gives error when no name is entered" do
    site = FactoryGirl.create(:site)
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit site_path(site)
    click_on 'Edit Class Information'
    fill_in 'Name', with: ''
    click_button 'Submit Class'
    expect(page).to have_content 'errors'
  end

  it "gives an error when an invalid address is entered" do
    site = FactoryGirl.create(:site)
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit site_path(site)
    click_on 'Edit Class Information'
    fill_in 'Address', with: 'not a real address'
    fill_in 'City', with: 'not a real city'
    fill_in 'Zip Code', with: '00000'
    click_button 'Submit Class'
    expect(page).to have_content 'Address is not valid.'
  end
end
