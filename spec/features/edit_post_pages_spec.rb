require 'rails_helper'

describe "the edit a post process" do
  it "edits a post", js: true do
    FactoryGirl.create(:post)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit posts_path
    click_link 'edit-post'
    fill_in 'Title', with: 'New Class at Bridger Elementary School'
    click_button 'Submit Post'
    expect(page).to have_content 'School'
  end

  it 'returns error if title is not filled in' do
    FactoryGirl.create(:post)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit posts_path
    click_link 'edit-post'
    fill_in 'Title', with: ''
    click_button 'Submit Post'
    expect(page).to have_content 'your post updates have not been successfully processed'
  end
end
