require 'rails_helper'

describe 'the view a site process', vcr: true do
  it 'views an individual site' do
    FactoryGirl.create(:site)
    visit sites_path
    click_on 'Sunshine ESL Class'
    expect(page).to have_content '123 ABC St'
  end

  it 'only shows admin information if admin is logged in' do
    FactoryGirl.create(:site)
    FactoryGirl.create(:admin)
    visit admin_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button 'Log in'
    visit sites_path
    click_on 'Sunshine ESL Class'
    expect(page).to have_content 'Last contacted 9/16 by Stephanie'
  end
end
