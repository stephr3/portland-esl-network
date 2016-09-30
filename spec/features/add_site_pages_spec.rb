require 'rails_helper'

describe "the add a site process" do
  it "adds a new site" do
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    click_link 'Add a New Class'
    fill_in 'Name', with: 'ESL Class'
    fill_in 'Address', with: "123 ABC Street"
    fill_in 'City', with: "Portland"
    select('OR', from: 'site_state')
    select('Downtown', from: 'site_region')
    click_on 'Submit Class'
    expect(page).to have_content 'ESL Classes'
  end

  it "gives error when no name is entered" do
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit new_site_path
    click_on 'Submit Class'
    expect(page).to have_content 'errors'
  end

  it "requires an admin login to create a new class" do
    visit root_path
    click_link 'Add a New Class'
    expect(page).to have_content 'Username'
  end

  it "gives an error when an invalid address is entered" do
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit new_site_path
    fill_in 'Name', with: 'ESL Class'
    fill_in 'Address', with: "this is not a real address"
    fill_in 'City', with: "not a city"
    select('OR', from: 'site_state')
    select('Downtown', from: 'site_region')
    fill_in 'Zip Code', with: '11111'
    click_on 'Submit Class'
    expect(page).to have_content 'Address is not valid.'
  end
end
