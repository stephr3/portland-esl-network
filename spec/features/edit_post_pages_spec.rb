require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    FactoryGirl.create(:post)
    visit root_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit posts_path
    click_link 'Edit Post'
    fill_in 'Title', :with => 'New Class at Bridger Elementary School'
    click_button 'Submit Post'
    expect(page).to have_content 'School'
  end
end
