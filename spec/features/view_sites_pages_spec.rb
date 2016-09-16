require 'rails_helper'

describe 'the view sites process' do
  it 'views all sites' do
    FactoryGirl.create(:site)
    visit root_path
    expect(page).to have_content 'Sunshine ESL Class'
  end

  it 'filters sites by region' do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'Gresham'
    expect(page).to have_no_content 'Sunshine ESL Class'
  end
end
