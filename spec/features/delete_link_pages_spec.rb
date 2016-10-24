require 'rails_helper'

describe "the delete a link process" do
  it "deletes a link" do
    link = FactoryGirl.create(:link)
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit 'links?type=learning'
    click_on "Delete Link"
    expect(page).to have_no_content 'Multnomah County Library Web Resources'
  end
end
