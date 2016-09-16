require 'rails_helper'

describe "the admin logout process" do
  it "allows the admin to logout" do
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    click_link 'Log out'
    expect(page).to have_content 'Admin Login'
  end
end
