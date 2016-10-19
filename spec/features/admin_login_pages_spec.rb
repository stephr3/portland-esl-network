require 'rails_helper'

describe "the admin login process" do
  it "allows the admin to log in" do
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    expect(page).to have_content 'Admin'
  end

  it "returns error if admin username or password are wrong" do
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', :with => 'wrong_name'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    expect(page).to have_content 'There was a problem with your login.'
  end
end
