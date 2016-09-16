require 'rails_helper'

describe "the delete a post process" do
  it "deletes a post" do
    post = FactoryGirl.create(:post)
    visit root_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit posts_path
    click_on "Delete Post"
    expect(page).to have_no_content 'Bridger Elementary'
  end
end
