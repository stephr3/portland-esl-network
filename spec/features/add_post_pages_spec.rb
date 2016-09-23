require 'rails_helper'

describe "the add a post process" do
  it "adds a new post", js: true do
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit posts_path
    click_link 'Add a New Post'
    expect(page).to have_no_content 'Add a New Post'
    fill_in 'Title', :with => 'New ESL Class at Bridger Elementary'
    fill_in 'Content', :with => 'There is a new class at Bridger Elementary. Contact Stephanie for further information.'
    click_button 'Submit Post'
    expect(page).to have_content 'New ESL Class at Bridger Elementary'
    expect(page).to have_content 'Add a New Post'
  end

  it 'will not allow a user to add a post if they are not logged in as an admin' do
    visit posts_path
    expect(page).to have_no_content 'Add a New Post'
  end

  it 'will return error if title is not filled out' do
    FactoryGirl.create(:admin)
    visit sites_path
    click_link 'Admin Login'
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit posts_path
    click_link 'Add a New Post'
    fill_in 'Content', :with => 'There is a new class at Bridger Elementary. Contact Stephanie for further information.'
    click_button 'Submit Post'
    expect(page).to have_content 'your post has not been successfully created'
  end
end
