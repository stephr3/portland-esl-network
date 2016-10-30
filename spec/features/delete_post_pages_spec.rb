require 'rails_helper'

describe "the delete a post process" do
  it "deletes a post" do
    post = FactoryGirl.create(:post)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit posts_path
    click_on "delete-post"
    expect(page).to have_no_content 'Bridger Elementary'
  end
end
