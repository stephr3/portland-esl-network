require 'rails_helper'

describe 'the view a site process' do
  it 'views an individual site', vcr: true do
    FactoryGirl.create(:site)
    visit root_path
    click_on 'Sunshine ESL Class'
    expect(page).to have_content '123 ABC St'
  end
end
