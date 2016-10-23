require 'rails_helper'

describe 'the search sites process', vcr: true do
  it 'searches for a site' do
    FactoryGirl.create(:site)
    FactoryGirl.create(:site, name: 'Other ESL Class')
    visit sites_path
    fill_in 'site-search', :with => 'Sunshine ESL'
    click_button 'Search Classes'
    expect(page).to have_content 'Sunshine ESL Class'
    expect(page).to have_no_content 'Other ESL Class'
  end

  it 'returns error if site is not found' do
    FactoryGirl.create(:site)
    visit sites_path
    fill_in 'site-search', :with => 'Random ESL'
    click_button 'Search Classes'
    expect(page).to have_content 'Sorry'
  end
end
