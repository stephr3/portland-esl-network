require 'rails_helper'

describe "the admin logout process" do
  it "allows the admin to logout" do
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit admin_path
    click_link 'Log out'
    expect(page).to have_no_content 'Admin'
  end
end
