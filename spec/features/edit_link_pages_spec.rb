require 'rails_helper'

describe "the edit a link process" do
  it "edits a link", js: true do
    FactoryGirl.create(:admin)
    FactoryGirl.create(:link)
    visit admin_path
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit '/links?type=learning'
    click_link 'Edit Link'
    expect(page).to have_no_content 'Edit Link'
    fill_in 'Title', :with => 'Updated Link Title'
    click_button 'Submit Link'
    expect(page).to have_content 'Updated Link Title'
    expect(page).to have_content 'Edit Link'
  end

  it 'returns error if title is not filled in' do
    FactoryGirl.create(:link)
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    visit '/links?type=learning'
    click_link 'Edit Link'
    fill_in 'Title', :with => ''
    click_button 'Submit Link'
    expect(page).to have_content 'your link updates have not been successfully submitted'
  end
end
