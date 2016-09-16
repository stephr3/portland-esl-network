require 'rails_helper'

describe "the edit a site process" do
  it "edits a site" do
    site = FactoryGirl.create(:site)
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
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
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit site_path(site)
    click_on 'Edit Class Information'
    fill_in 'Name', :with => ''
    click_button 'Submit Class'
    expect(page).to have_content 'errors'
  end
end
